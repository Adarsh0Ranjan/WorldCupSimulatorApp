//
//  LoadTeamsUseCase.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


import Foundation

final class LoadTeamsUseCase {

    private let repository: TeamRepository

    init(repository: TeamRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Team] {
        try await repository.fetchTeams()
    }
}