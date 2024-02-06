import Foundation

/// Parses a given string (such as Game 1: 4 green, 7 blue; 2 blue, 4 red; 5 blue, 2 green, 2 red; 1 green, 3 red, 9 blue; 3 green, 9 blue; 7 green, 2 blue, 2 red)
/// - Returns: the id of the game if it's a valid game or nil if it's not
public func parseGame(_ game: String) -> Int? {
  // validate input & store the id of the game
  let interpreter = InputInterpreter(input: game)

  // if all draws are valid, return the id of the game
  return interpreter.isGameValid ? interpreter.gameId : nil
}
