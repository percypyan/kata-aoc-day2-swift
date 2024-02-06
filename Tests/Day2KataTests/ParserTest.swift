import XCTest
@testable import Day2KataLib

class ParseTest : XCTestCase {

  func testFeedInputInterpreterWithEmptyString() {
    let interpreter = InputInterpreter(input: "")

    let result = interpreter.isInputValid
    XCTAssertEqual(result, false)
  }

  func testFeedInputInterpreterWithFirstWordIsNotGame() {
    let interpreter = InputInterpreter(input: "toto")
    let secondInterpreter = InputInterpreter(input: "game")

    let result = interpreter.isInputValid
    XCTAssertEqual(result, false)
    XCTAssertEqual(secondInterpreter.isInputValid, false)
  }

  // Game 1: 1 red

  func testInputInterpreterWithValidString() {
    let interpreter = InputInterpreter(input: "Game 1: 1 red")
    let interpreter2 = InputInterpreter(input: "Game 1: 1 red, 1 red")
    let interpreter3 = InputInterpreter(input: "Game 1: 1 red; 1 red")

    XCTAssertEqual(interpreter.isInputValid, true)
    XCTAssertEqual(interpreter2.isInputValid, false)
    XCTAssertEqual(interpreter3.isInputValid, true)
  }

  func testInputInterpreterWithInvalidString() {
    let interpreter = InputInterpreter(input: "Game1: 1 red")
    let interpreter2 = InputInterpreter(input: "Game 1: 1 purple")
    let interpreter3 = InputInterpreter(input: "Game 1: 1 redblue")
    let interpreter4 = InputInterpreter(input: "Game 1: 1 red, 1 blue, 2 green, 2 red, 4 red, 6 blue")

    XCTAssertEqual(interpreter.isInputValid, false)
    XCTAssertEqual(interpreter2.isInputValid, false)
    XCTAssertEqual(interpreter3.isInputValid, false)
    XCTAssertEqual(interpreter4.isInputValid, false)
  }

  func testInputInterpreterParseTheIdOfTheGame() {
    let interpreter = InputInterpreter(input: "Game 1: 1 red")
    let interpreter2 = InputInterpreter(input: "Game 2: 1 red")
    let interpreter3 = InputInterpreter(input: "Game 56: 1 red")


    XCTAssertEqual(interpreter.gameId, 1)
    XCTAssertEqual(interpreter2.gameId, 2)
    XCTAssertEqual(interpreter3.gameId, 56)

  }

  func testGetDraw() {
    let interpreter = InputInterpreter(input: "Game 1: 1 red, 1 blue, 1 green")
    let interpreter2 = InputInterpreter(input: "Game 1: 1 red, 2 blue, 3 green")
    let interpreter3 = InputInterpreter(input: "Game 1: 1 red, 2 blue, 3 green; 1 red, 1 blue, 1 green")
    let interpreter4 = InputInterpreter(input: "Game 1: 1 red, 1 purple")

    XCTAssertEqual(interpreter.draws, [Draw(red:1, green: 1, blue:1)])
    XCTAssertEqual(interpreter2.draws, [Draw(red:1, green: 3, blue:2)])
    XCTAssertEqual(interpreter3.draws, [Draw(red:1, green: 3, blue:2), Draw(red:1, green: 1, blue:1)])
    XCTAssertEqual(interpreter4.draws, [Draw(red: 1)])
  }

  func testIsGameValid() { // Max red 12, max green 13, max blue 14
    let interpreter = InputInterpreter(input: "Game 1: 1 red, 1 blue, 1 green")
    let interpreter2 = InputInterpreter(input: "Game 1: 13 red, 15 blue, 14 green")
    let interpreter3 = InputInterpreter(input: "Game 1: 1 red, 70 blue, 2 green")
    let interpreter4 = InputInterpreter(input: "Game 1: 1 red, 1 blue, 2 green; 120 red, 250 blue, 800 green")
    let interpreter5 = InputInterpreter(input: "Game 1: 1 red, 1 blue, 2 green, 2 red, 4 red, 6 blue")


    XCTAssertEqual(interpreter.isGameValid, true)
    XCTAssertEqual(interpreter2.isGameValid, false)
    XCTAssertEqual(interpreter3.isGameValid, false)
    XCTAssertEqual(interpreter4.isGameValid, false)
    XCTAssertEqual(interpreter5.isGameValid, false)
  }

}