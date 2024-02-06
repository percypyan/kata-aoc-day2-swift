import XCTest
@testable import Day2Lib

final class GameTests: XCTestCase {

    func testGameIsValid() throws {
        // Valid games
        let validGame = Game(id: 1, draws: [[
            CubeGroup(type: .red, count: 10),
            CubeGroup(type: .green, count: 10),
            CubeGroup(type: .blue, count: 14),
        ], [
            CubeGroup(type: .red, count: 2),
            CubeGroup(type: .green, count: 1),
            CubeGroup(type: .blue, count: 4),
        ]])
        let validGame2 = Game(id: 2, draws: [[
            CubeGroup(type: .red, count: 1),
            CubeGroup(type: .green, count: 1),
            CubeGroup(type: .blue, count: 1),
        ], [
            CubeGroup(type: .red, count: 3),
            CubeGroup(type: .green, count: 4),
            CubeGroup(type: .blue, count: 5),
        ]])
        let validGame3 = Game(id: 3, draws: [[
            CubeGroup(type: .red, count: 10),
            CubeGroup(type: .green, count: 10),
            CubeGroup(type: .blue, count: 10),
        ], [
            CubeGroup(type: .red, count: 12),
            CubeGroup(type: .green, count: 13),
            CubeGroup(type: .blue, count: 14),
        ]])
        // Invalid games
        let invalidGame = Game(id: 4, draws: [[
            CubeGroup(type: .red, count: 13),
            CubeGroup(type: .green, count: 13),
            CubeGroup(type: .blue, count: 14),
        ], [
            CubeGroup(type: .red, count: 12),
            CubeGroup(type: .green, count: 13),
            CubeGroup(type: .blue, count: 14),
        ]])
        let invalidGame2 = Game(id: 5, draws: [[
            CubeGroup(type: .red, count: 16),
            CubeGroup(type: .green, count: 10),
            CubeGroup(type: .blue, count: 10),
        ],  [
            CubeGroup(type: .red, count: 13),
            CubeGroup(type: .green, count: 14),
            CubeGroup(type: .blue, count: 15),
        ]])
        let invalidGame3 = Game(id: 6, draws: [[
            CubeGroup(type: .red, count: 16),
            CubeGroup(type: .green, count: 16),
            CubeGroup(type: .blue, count: 16),
        ], [
            CubeGroup(type: .red, count: 1),
            CubeGroup(type: .green, count: 1),
            CubeGroup(type: .blue, count: 1),
        ]])

        XCTAssertTrue(validGame.isValid)
        XCTAssertTrue(validGame2.isValid)
        XCTAssertTrue(validGame3.isValid)
        XCTAssertFalse(invalidGame.isValid)
        XCTAssertFalse(invalidGame2.isValid)
        XCTAssertFalse(invalidGame3.isValid)
    }

}