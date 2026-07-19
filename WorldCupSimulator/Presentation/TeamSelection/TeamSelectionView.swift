//
//  TeamSelectionView.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


import SwiftUI

struct TeamSelectionView: View {

    @StateObject private var viewModel: TeamSelectionViewModel
    @State private var navigateToMatch = false

    init(viewModel: TeamSelectionViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {

        NavigationStack {

            VStack(spacing: 0) {

                List {

                    ForEach(viewModel.teams) { team in

                        TeamRow(
                            team: team,
                            isSelected: viewModel.isSelected(team)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.toggleSelection(for: team)
                        }
                    }
                }

                Button("Start Match") {
                    navigateToMatch = true
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(
                    viewModel.canStartMatch ? Color.green : Color.gray
                )
                .foregroundColor(.white)
                .disabled(!viewModel.canStartMatch)
            }
            .navigationDestination(isPresented: $navigateToMatch) {
                MatchView(
                    viewModel: MatchViewModel(
                        teamOne: viewModel.selectedTeams[0],
                        teamTwo: viewModel.selectedTeams[1],
                        playBallUseCase: PlayBallUseCase()
                    )
                )
            }
        }
        .task {
            await viewModel.loadTeams()
        }
    }
}
