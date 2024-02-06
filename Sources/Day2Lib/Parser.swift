import Foundation

public func parseGameID(forLine line: String) -> Int? {
    let regex = /^Game (\d+):.*$/
    guard let match = line.wholeMatch(of: regex) else {
        return nil
    }
    return Int(match.1)
}

public func parseDraws(forLine line: String) -> [Draw]? {
    let regex = /^Game (\d+):( (\d+) (\w+)[;,])* (\d+) (\w+)$/
    guard line.contains(regex) else {
        return nil
    }

    guard let drawsString = line.split(separator: ":").last else {
        return nil
    }

    var draws: [Draw] = []
    for drawString in drawsString.split(separator: ";") {
        var draw: Draw = []
        for cubeGroupString in drawString.split(separator: ",") {
            let groupParts = cubeGroupString.split(separator: " ")
            guard
                let type = CubeType(rawValue: String(groupParts.last ?? "")),
                let count = Int(groupParts.first ?? "")
            else { return nil }
            draw.append(CubeGroup(type: type, count: count))
        }
        draws.append(draw)
    }
    return draws
}

public func parseGame(forLine line: String) -> Game? {
    guard let gameID = parseGameID(forLine: line) else {
        return nil
    }
    guard let draws = parseDraws(forLine: line) else {
        return nil
    }
    return Game(id: gameID, draws: draws)
}
