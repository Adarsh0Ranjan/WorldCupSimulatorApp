//
//  Score.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


import Foundation

struct Score {

    private(set) var runs: Int = 0
    private(set) var wickets: Int = 0
    private(set) var balls: Int = 0

    mutating func update(with outcome: BallOutcome) {

        runs += outcome.runs

        if outcome.isWicket {
            wickets += 1
        }

        if outcome.countsAsBall {
            balls += 1
        }
    }

    var overs: String {
        "\(balls / 6).\(balls % 6)"
    }
}
