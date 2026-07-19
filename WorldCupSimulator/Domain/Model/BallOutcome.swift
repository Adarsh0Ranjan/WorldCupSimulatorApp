//
//  BallOutcome.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


import Foundation

enum BallOutcome: CaseIterable {

    case dot
    case one
    case two
    case three
    case four
    case six
    case wicket
    case wide
    case noBall

    var runs: Int {
        switch self {
        case .dot:
            return 0
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .six:
            return 6
        case .wicket:
            return 0
        case .wide:
            return 1
        case .noBall:
            return 1
        }
    }

    var isWicket: Bool {
        self == .wicket
    }

    var countsAsBall: Bool {
        switch self {
        case .wide, .noBall:
            return false
        default:
            return true
        }
    }

    var displayValue: String {
        switch self {
        case .dot:
            return "0"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .six:
            return "6"
        case .wicket:
            return "W"
        case .wide:
            return "WD"
        case .noBall:
            return "NB"
        }
    }
}

extension BallOutcome {

    static let weights: [OutcomeWeight] = [
        OutcomeWeight(outcome: .dot, weight: 25),
        OutcomeWeight(outcome: .one, weight: 25),
        OutcomeWeight(outcome: .two, weight: 15),
        OutcomeWeight(outcome: .three, weight: 5),
        OutcomeWeight(outcome: .four, weight: 12),
        OutcomeWeight(outcome: .six, weight: 5),
        OutcomeWeight(outcome: .wicket, weight: 5),
        OutcomeWeight(outcome: .wide, weight: 4),
        OutcomeWeight(outcome: .noBall, weight: 4)
    ]

    static func random() -> BallOutcome {

        let totalWeight = weights.reduce(0) { $0 + $1.weight }

        let random = Int.random(in: 1...totalWeight)

        var currentWeight = 0

        for item in weights {

            currentWeight += item.weight

            if random <= currentWeight {
                return item.outcome
            }
        }

        return .dot
    }
}
