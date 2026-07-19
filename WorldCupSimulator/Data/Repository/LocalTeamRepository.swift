//
//  LocalTeamRepository.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


import Foundation

final class LocalTeamRepository: TeamRepository {

    private let jsonLoader: JSONLoader

    init(jsonLoader: JSONLoader = JSONLoader()) {
        self.jsonLoader = jsonLoader
    }

    func fetchTeams() async throws -> [Team] {
        try jsonLoader.load(
            fileName: "teams",
            as: [Team].self
        )
    }
}
