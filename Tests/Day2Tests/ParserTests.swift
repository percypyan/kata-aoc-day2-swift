import XCTest
@testable import Day2Lib

final class ParserTests: XCTestCase {
    func testParseGameID() throws {
        XCTAssertEqual(parseGameID(forLine: "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"), 1)
        XCTAssertEqual(parseGameID(forLine: "Game 34: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"), 34)
        XCTAssertEqual(parseGameID(forLine: "2: cdefg"), nil)
        XCTAssertEqual(parseGameID(forLine: "2 Game: ccccccccc"), nil)
    }

    func testParseDraws() throws {
        XCTAssertEqual(parseDraws(
            forLine: "Game 1: 3 blue, 4 red"),
            [[
                CubeGroup(type: .blue, count: 3),
                CubeGroup(type: .red, count: 4)
            ]])
        XCTAssertEqual(parseDraws(
            forLine: "Game 34: 3 blue, 4 red; 1 red, 2 green, 6 blue; 1 green"),
            [[
                CubeGroup(type: .blue, count: 3),
                CubeGroup(type: .red, count: 4)
            ],
            [
                CubeGroup(type: .red, count: 1),
                CubeGroup(type: .green, count: 2),
                CubeGroup(type: .blue, count: 6),
            ],
            [
                CubeGroup(type: .green, count: 1),
            ],])
        XCTAssertEqual(parseDraws(forLine: "Game 24:"), nil)
        XCTAssertEqual(parseDraws(forLine: "Game 31: not working"), nil)
    }

    func testParseGame() throws {
        XCTAssertEqual(parseGame(forLine: "Game 1: 3 blue, 4 red"), Game(id: 1, draws: [[
            CubeGroup(type: .blue, count: 3),
            CubeGroup(type: .red, count: 4)
        ]]))
        XCTAssertEqual(parseGame(forLine: "Game 34: 3 blue, 4 red; 1 red, 2 green, 6 blue; 1 green"), Game(id: 34, draws: [[
            CubeGroup(type: .blue, count: 3),
            CubeGroup(type: .red, count: 4)
        ],
        [
            CubeGroup(type: .red, count: 1),
            CubeGroup(type: .green, count: 2),
            CubeGroup(type: .blue, count: 6),
        ],
        [
            CubeGroup(type: .green, count: 1),
        ],]))
        XCTAssertEqual(parseGame(forLine: "Game 24:"), nil)
        XCTAssertEqual(parseGame(forLine: "Game 31: not working"), nil)
    }

    // Linux compliance
    static var allTests = [
        ("testParseGameID", testParseGameID),
        ("testParseDraws", testParseDraws),
    ]
}
