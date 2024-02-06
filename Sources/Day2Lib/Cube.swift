public enum CubeType: String {
    case red = "red"
    case blue = "blue"
    case green = "green"
}

public struct CubeGroup {
    let type: CubeType
    let count: Int
}

extension CubeGroup: Equatable {
    public static func == (lhs: CubeGroup, rhs: CubeGroup) -> Bool {
        return lhs.type == rhs.type && lhs.count == rhs.count
    }
}

