import Foundation
import XCTest
@testable import SumraCore

final class ArchiveCacheTests: XCTestCase {
    private func zip(_ sizes: [Int]) throws -> URL {
        guard FileManager.default.isExecutableFile(atPath: "/usr/bin/zip") else { throw XCTSkip("zip fixture generator unavailable") }
        let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        addTeardownBlock { try? FileManager.default.removeItem(at: root) }
        var names = [String]()
        for (index, size) in sizes.enumerated() {
            let name = "\(index).png"
            try Data(repeating: UInt8(65 + index), count: size).write(to: root.appendingPathComponent(name))
            names.append(name)
        }
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/zip")
        process.currentDirectoryURL = root
        process.arguments = ["-q", "comic.zip"] + names
        try process.run()
        process.waitUntilExit()
        XCTAssertEqual(process.terminationStatus, 0)
        let url = root.appendingPathComponent("comic.zip")
        return url
    }

    func testZipCompletesTheCurrentPrefixWithoutReopening() async throws {
        let size = 64 * 1024 + 3
        let url = try zip([1, size, 3])
        let archive = try Archive(url)
        XCTAssertEqual(try archive.data("0.png"), Data([65]))
        XCTAssertEqual(try archive.data("1.png", prefixBytes: 1024), Data(repeating: 66, count: 1024))
        try FileManager.default.moveItem(at: url, to: url.appendingPathExtension("moved"))

        let cancelledRead = Task.detached {
            withUnsafeCurrentTask { $0?.cancel() }
            return try archive.data("1.png")
        }
        do { _ = try await cancelledRead.value; XCTFail("A cancelled request must not consume the current entry") }
        catch is CancellationError { }

        XCTAssertEqual(try archive.data("1.png", prefixBytes: 7), Data(repeating: 66, count: 7))
        XCTAssertEqual(try archive.data("1.png", prefixBytes: 2048), Data(repeating: 66, count: 2048))
        XCTAssertEqual(try archive.data("0.png"), Data([65]))
        XCTAssertEqual(try archive.data("1.png"), Data(repeating: 66, count: size))
        XCTAssertEqual(try archive.data("2.png"), Data(repeating: 67, count: 3))
        XCTAssertEqual(try archive.data("1.png"), Data(repeating: 66, count: size))
    }

    func testEntryCacheEvictsByBytesAndPromotesRevisitedEntry() throws {
        let mib = 1024 * 1024
        let url = try zip([32 * mib, 31 * mib, 2 * mib])
        let archive = try Archive(url)
        XCTAssertEqual(try archive.data("0.png").count, 32 * mib)
        XCTAssertEqual(try archive.data("1.png").count, 31 * mib)
        XCTAssertEqual(try archive.data("0.png", prefixBytes: 1), Data([65]))
        XCTAssertEqual(try archive.data("2.png").count, 2 * mib)
        let moved = url.appendingPathExtension("moved")
        try FileManager.default.moveItem(at: url, to: moved)
        defer { try? FileManager.default.removeItem(at: moved) }
        // The 65 MiB working set evicts the least-recently-used 31 MiB entry.
        // Retained entries need no pathname reopen; an evicted ZIP entry does.
        XCTAssertEqual(try archive.data("0.png").count, 32 * mib)
        XCTAssertEqual(try archive.data("2.png").count, 2 * mib)
        XCTAssertThrowsError(try archive.data("1.png"))
    }

    func testOversizedEntryReturnsAllBytesWithoutDisplacingRecentEntries() throws {
        let size = 65 * 1024 * 1024
        let url = try zip([1, size])
        let archive = try Archive(url)
        XCTAssertEqual(try archive.data("0.png"), Data([65]))
        XCTAssertEqual(try archive.data("1.png", prefixBytes: 1024), Data(repeating: 66, count: 1024))
        XCTAssertEqual(try archive.data("1.png").count, size)
        let moved = url.appendingPathExtension("moved")
        try FileManager.default.moveItem(at: url, to: moved)
        defer { try? FileManager.default.removeItem(at: moved) }
        XCTAssertEqual(try archive.data("0.png"), Data([65]))
        XCTAssertThrowsError(try archive.data("1.png"))
    }
}
