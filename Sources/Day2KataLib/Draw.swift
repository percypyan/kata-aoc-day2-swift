
struct Draw {
  let red: Int
  let green: Int
  let blue: Int
  init(red: Int = 0, green: Int = 0, blue: Int = 0) {
    self.red = red
    self.green = green
    self.blue = blue
  }
}


extension Draw: Equatable {
  static func ==(_ me: Draw, _ comparedTo: Draw) -> Bool {
    return me.red == comparedTo.red && me.green == comparedTo.green && me.blue == comparedTo.blue
  }
}

extension Draw {
  static func +(_ me: Draw, _ other: Draw) -> Draw {
    return Draw(red: me.red + other.red, green: me.green + other.green, blue: me.blue + other.blue)
  }
}

extension Draw {
  var isValid: Bool {
     red <= 12 && blue <= 14 && green <= 13
  }
}
