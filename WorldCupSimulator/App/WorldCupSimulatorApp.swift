//
//  WorldCupSimulatorApp.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 18/07/26.
//

import SwiftUI

@main
struct WorldCupSimulatorApp: App {

    var body: some Scene {
        WindowGroup {

            let repository = LocalTeamRepository()

            let useCase = LoadTeamsUseCase(
                repository: repository
            )

            let viewModel = TeamSelectionViewModel(
                loadTeamsUseCase: useCase
            )

            TeamSelectionView(
                viewModel: viewModel
            )
        }
    }
}
