public typealias Draw = [CubeGroup]

extension Draw {
    func getCubeGroups(forType type: CubeType) -> [CubeGroup] {
        return self
            .filter { $0.type == type }
    }

    var isValid: Bool {
        for (type, maxCount) in Config.availableCubes {
            let count = self
                .getCubeGroups(forType: type)
                .reduce(0) { $0 + $1.count }
            if count > maxCount {
                return false
            }
        }
        return true
    }
}