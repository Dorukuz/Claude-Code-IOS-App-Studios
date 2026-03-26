import XCTest
@testable import AppStudkioPlaceholder

final class PlaceholderTests: XCTestCase {
    func testVersion() {
        XCTAssertEqual(AppStudkioPlaceholder.version, "0.1.0")
    }
}
