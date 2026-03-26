import XCTest
@testable import ClaudeCodeIOSAppStudios

final class LibraryStubTests: XCTestCase {
    func testVersion() {
        XCTAssertEqual(ClaudeCodeIOSAppStudios.version, "0.1.0")
    }
}
