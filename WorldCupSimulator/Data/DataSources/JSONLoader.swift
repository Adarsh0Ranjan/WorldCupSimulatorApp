//
//  JSONLoaderError.swift
//  WorldCupSimulator
//
//  Created by Adarsh Ranjan on 19/07/26.
//


import Foundation

enum JSONLoaderError: Error {
    case fileNotFound(String)
}

final class JSONLoader {

    func load<T: Decodable>(
        fileName: String,
        as type: T.Type
    ) throws -> T {

        guard let url = Bundle.main.url(
            forResource: fileName,
            withExtension: "json"
        ) else {
            throw JSONLoaderError.fileNotFound(fileName)
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder().decode(
            T.self,
            from: data
        )
    }
}