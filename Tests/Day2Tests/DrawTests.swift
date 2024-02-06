import XCTest
@testable import Day2Lib

final class DrawTests: XCTestCase {

    func testDrawArrayIsValid() throws {
        let validDraw = [
            CubeGroup(type: .red, count: 10),
            CubeGroup(type: .green, count: 10),
            CubeGroup(type: .blue, count: 14),
        ]
        let validDraw2 = [
            CubeGroup(type: .red, count: 1),
            CubeGroup(type: .green, count: 1),
            CubeGroup(type: .blue, count: 1),
        ]
        let validDraw3 = [
            CubeGroup(type: .red, count: 10),
            CubeGroup(type: .green, count: 10),
            CubeGroup(type: .blue, count: 10),
        ]
        let validDraw4 = [
            CubeGroup(type: .red, count: 12),
            CubeGroup(type: .green, count: 13),
            CubeGroup(type: .blue, count: 14),
        ]
        let invalidDraw = [
            CubeGroup(type: .red, count: 13),
            CubeGroup(type: .green, count: 13),
            CubeGroup(type: .blue, count: 14),
        ]
        let invalidDraw2 = [
            CubeGroup(type: .red, count: 16),
            CubeGroup(type: .green, count: 10),
            CubeGroup(type: .blue, count: 10),
        ]
        let invalidDraw3 = [
            CubeGroup(type: .red, count: 16),
            CubeGroup(type: .green, count: 16),
            CubeGroup(type: .blue, count: 16),
        ]
        XCTAssertTrue(validDraw.isValid)
        XCTAssertTrue(validDraw2.isValid)
        XCTAssertTrue(validDraw3.isValid)
        XCTAssertTrue(validDraw4.isValid)
        XCTAssertFalse(invalidDraw.isValid)
        XCTAssertFalse(invalidDraw2.isValid)
        XCTAssertFalse(invalidDraw3.isValid)
    }

    // Linux compliance
    static var allTests = [
        ("testDrawArrayIsValid", testDrawArrayIsValid),
    ]
}