import Foundation
import Day2KataLib

if CommandLine.arguments.count < 2 {
    print("Usage: \(CommandLine.arguments[0]) [<input file>...]")
    exit(1)
}

// 12 red cubes, 13 green cubes, and 14 blue
// return the sum of the IDs of the valid games

CommandLine.arguments[1...].forEach { path in
    guard let dataString = try? String(contentsOfFile: path) else {
        print("Could not read file \(path)")
        return
    }
    let games = dataString.split(separator: "\n").compactMap({ line -> Int? in
        guard let gameId = parseGame(String(line)) else {
            print("Game is not valid.")
            return nil
        }
            print("Game \(gameId) is valid.")

        return gameId
    })
    print("Game IDs total: \(games.reduce(0) { $0 + $1 })")
}
