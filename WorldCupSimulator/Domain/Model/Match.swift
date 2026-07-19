//
//  Match.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


import Foundation

struct Match {

    let teamOne: Team
    let teamTwo: Team

    var firstInnings: Innings
    var secondInnings: Innings?

    init(teamOne: Team, teamTwo: Team) {
        self.teamOne = teamOne
        self.teamTwo = teamTwo

        self.firstInnings = Innings(
            battingTeam: teamOne,
            bowlingTeam: teamTwo,
            target: nil
        )
    }

    mutating func play(_ outcome: BallOutcome) {
        if isCompleted {
            return
        }

        // First innings
        if secondInnings == nil {

            firstInnings.play(outcome)

            if firstInnings.isCompleted {

                secondInnings = Innings(
                    battingTeam: teamTwo,
                    bowlingTeam: teamOne,
                    target: firstInnings.score.runs
                )
            }

            return
        }

        // Second innings
        secondInnings?.play(outcome)
    }

    var currentInnings: Innings {
        secondInnings ?? firstInnings
    }

    var isSecondInnings: Bool {
        secondInnings != nil
    }

    var isCompleted: Bool {

        guard let secondInnings else {
            return false
        }

        return secondInnings.isCompleted
    }

    var winner: Team? {

        guard isCompleted,
              let secondInnings else {
            return nil
        }

        if secondInnings.score.runs > firstInnings.score.runs {
            return secondInnings.battingTeam
        }

        if firstInnings.score.runs > secondInnings.score.runs {
            return firstInnings.battingTeam
        }

        return nil
    }
}
