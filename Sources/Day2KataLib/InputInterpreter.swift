class InputInterpreter {
    let input: String

    var isInputValid: Bool {
        let isGameValidRegex = /^Game (\d+): ((\d+ (red|green|blue)[;,] )*\d+ (red|green|blue))$/
        let isValid = self.input.wholeMatch(of: isGameValidRegex) != nil

        if isValid {
            let drawsInput = self.getDrawsInput()

            for drawInput in drawsInput {
                let redMatches = drawInput.matches(of: /red/)
                let blueMatches = drawInput.matches(of: /blue/)
                let greenMatches = drawInput.matches(of: /green/)

                guard redMatches.count <= 1 && blueMatches.count <= 1 && greenMatches.count <= 1 else {
                    return false
                }
            }
        }
        return isValid
    }

    var gameId: Int? {
        let gameIdRegex = /^Game (\d+):.*/
        guard let gameIdMatch = self.input.wholeMatch(of: gameIdRegex) else {
            return nil
        }

        return Int(gameIdMatch.1)
    }

    var draws: [Draw] {
        var draws: [Draw] = []


        let drawInput = self.getDrawsInput()

        for draw in drawInput {
            let drawsRegex = /(\d+) (red|green|blue)/
            let drawsMatches = draw.matches(of: drawsRegex)

            guard drawsMatches.count > 0 else {
                continue
            }

            var currentDraw = Draw()
            for drawMatch in drawsMatches {
                switch drawMatch.2 {
                    case "red":
                        currentDraw = currentDraw + Draw(red: Int(drawMatch.1) ?? 0)
                    case "green":
                        currentDraw = currentDraw + Draw(green: Int(drawMatch.1) ?? 0)
                    case "blue":
                        currentDraw = currentDraw + Draw(blue: Int(drawMatch.1) ?? 0)
                    default:
                        break
                }
            }
            draws.append(currentDraw)

        }
        return draws
    }

    var isGameValid: Bool {
        if !isInputValid {
            return false
        }

        for draw in draws {
            if !draw.isValid {
                return false
            }
        }
        return true
    }

    private func getDrawsInput() -> [Substring.SubSequence] {

        let inputSplittedOnGame = self.input.split(separator: ":")

        guard inputSplittedOnGame.count > 0 else {
            return []
        }

        let inputSplittedOnDraws = inputSplittedOnGame[1].split(separator: ";")

        guard inputSplittedOnDraws.count > 0 else {
            return []
        }

        return inputSplittedOnDraws

    }

    init(input: String) {
        self.input = input
    }
}
