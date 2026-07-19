//
//  TeamRepository.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


protocol TeamRepository {
    func fetchTeams() async throws -> [Team]
}