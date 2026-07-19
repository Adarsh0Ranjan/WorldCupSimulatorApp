import SwiftUI

struct MatchView: View {

    @StateObject var viewModel: MatchViewModel

    var body: some View {

        VStack(spacing: 0) {


            TeamScoreView(
                title: firstTeamTitle,
                scoreText: firstTeamScore,
                oversText: firstTeamOvers
            )

            Divider()

            // Team 2
            TeamScoreView(
                title: secondTeamTitle,
                scoreText: secondTeamScore,
                oversText: secondTeamOvers
            )

            Divider()

            ZStack {
                Color.gray.opacity(0.25)

                Text(centerText)
                    .font(.system(size: 42, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)

            Button(action: {
                viewModel.playNextBall()
            }) {

                Text(viewModel.isMatchCompleted ? "Match Over" : "Play Next Ball")
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .foregroundColor(.white)
            }
            .background(Color.green)
            .disabled(viewModel.isMatchCompleted)
        }
        .navigationTitle("Match Center")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var firstTeamTitle: String {

        if viewModel.match.secondInnings == nil {
            return "\(viewModel.match.teamOne.name) (Batting)"
        }

        return "\(viewModel.match.teamOne.name) (Bowling)"
    }

    private var secondTeamTitle: String {

        if viewModel.match.secondInnings == nil {
            return "\(viewModel.match.teamTwo.name) (Bowling)"
        }

        return "\(viewModel.match.teamTwo.name) (Batting)"
    }

    private var firstTeamScore: String {

        let score = viewModel.match.firstInnings.score
        return "Score: \(score.runs)/\(score.wickets)"
    }

    private var firstTeamOvers: String {

        "Overs: \(viewModel.match.firstInnings.score.overs)"
    }

    private var secondTeamScore: String {

        guard let innings = viewModel.match.secondInnings else {
            return "yet to bat"
        }

        return "Score: \(innings.score.runs)/\(innings.score.wickets)"
    }

    private var secondTeamOvers: String {

        guard let innings = viewModel.match.secondInnings else {
            return "yet to bat"
        }

        return "Overs: \(innings.score.overs)"
    }

    private var centerText: String {

        if viewModel.isMatchCompleted {
            return viewModel.winnerText
        }

        return viewModel.lastOutcome?.displayValue ?? "-"
    }
}

struct TeamScoreView: View {

    let title: String
    let scoreText: String
    let oversText: String

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text(title)
                .font(.headline)

            HStack {

                Text(scoreText)

                Spacer()

                Text(oversText)
            }
        }
        .padding()
    }
}
