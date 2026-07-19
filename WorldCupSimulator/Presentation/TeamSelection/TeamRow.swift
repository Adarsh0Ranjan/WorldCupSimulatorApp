//
//  TeamRow.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//



import SDWebImageSwiftUI
import SwiftUI

struct TeamRow: View {

    let team: Team
    let isSelected: Bool

    var body: some View {

        HStack {

            WebImage(url: URL(string: team.flag))
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 28)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            Text(team.name)

            Spacer()

        }
        .padding(.vertical, 4)
        .listRowBackground(
            isSelected ? Color.gray.opacity(0.4) : Color.clear
        )
    }
}
