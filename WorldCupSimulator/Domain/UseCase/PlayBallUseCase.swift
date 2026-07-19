//
//  PlayBallUseCase.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//

import Foundation

struct PlayBallUseCase {

    func execute(match: Match) -> (match: Match, outcome: BallOutcome?) {

        if match.isCompleted {
            return (match, nil)
        }

        let outcome = BallOutcome.random()

        var updatedMatch = match
        updatedMatch.play(outcome)

        return (updatedMatch, outcome)
    }
}
