//
//  TeamSelectionViewModel.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


import Combine
import Foundation

@MainActor
final class TeamSelectionViewModel: ObservableObject {

    @Published private(set) var teams: [Team] = []
    @Published private(set) var selectedTeams: [Team] = []

    private let loadTeamsUseCase: LoadTeamsUseCase

    init(loadTeamsUseCase: LoadTeamsUseCase) {
        self.loadTeamsUseCase = loadTeamsUseCase
    }

    func loadTeams() async {
        do {
            teams = try await loadTeamsUseCase.execute()
            
        } catch {
            print("Failed to load teams: \(error)")
        }
    }
    
    func select(_ team: Team) {

        if selectedTeams.contains(team) {
            selectedTeams.removeAll { $0 == team }
            return
        }

        guard selectedTeams.count < 2 else {
            return
        }

        selectedTeams.append(team)
    }

    func toggleSelection(for team: Team) {
        if let index = selectedTeams.firstIndex(of: team) {
            selectedTeams.remove(at: index)
            return
        }

        guard selectedTeams.count < 2 else {
            return
        }

        selectedTeams.append(team)
    }

    func isSelected(_ team: Team) -> Bool {
        selectedTeams.contains(team)
    }

    var canStartMatch: Bool {
        selectedTeams.count == 2
    }

    var firstTeam: Team? {
        selectedTeams.first
    }

    var secondTeam: Team? {
        selectedTeams.count > 1 ? selectedTeams[1] : nil
    }
}
