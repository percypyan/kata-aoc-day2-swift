public struct Game {
    public let id: Int
    public let draws: [Draw]

    public var isValid: Bool {
        return draws.count > 0 && draws.reduce(true) { $0 && $1.isValid }
    }
}

extension Game: Equatable {
    public static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.id == rhs.id && lhs.draws == rhs.draws
    }
}