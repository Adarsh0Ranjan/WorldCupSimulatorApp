//
//  Innings.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


import Foundation


struct Innings {

    let battingTeam: Team
    let bowlingTeam: Team

    var score = Score()

    let target: Int?

    mutating func play(_ outcome: BallOutcome) {
        score.update(with: outcome)
    }

    var isCompleted: Bool {

        if score.wickets >= 3 {
            return true
        }

        if score.balls >= 12 {
            return true
        }

        if let target,
           score.runs > target {
            return true
        }

        return false
    }
}
