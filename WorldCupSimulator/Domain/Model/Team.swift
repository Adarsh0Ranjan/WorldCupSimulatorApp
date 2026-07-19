//
//  Team.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 18/07/26.
//

import Foundation

struct Team: Codable, Identifiable, Hashable {

    var id: String { name }

    let name: String
    let flag: String
}
