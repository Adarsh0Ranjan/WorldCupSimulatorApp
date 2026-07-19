//
//  MatchViewModel.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//

import Combine
import Foundation

@MainActor
final class MatchViewModel: ObservableObject {

    @Published private(set) var match: Match
    @Published private(set) var lastOutcome: BallOutcome?

    private let playBallUseCase: PlayBallUseCase

    init(
        teamOne: Team,
        teamTwo: Team,
        playBallUseCase: PlayBallUseCase = PlayBallUseCase()
    ) {
        self.playBallUseCase = playBallUseCase
        self.match = Match(teamOne: teamOne, teamTwo: teamTwo)
    }

    func playNextBall() {

        let result = playBallUseCase.execute(match: match)

        match = result.match
        lastOutcome = result.outcome
    }

    var isMatchCompleted: Bool {
        match.isCompleted
    }

    var winnerText: String {

        guard let winner = match.winner else {
            return "Match Drawn"
        }

        return "\(winner.name) won the match"
    }
}
