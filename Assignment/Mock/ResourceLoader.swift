//
//  ResourceLoader.swift
//  -Assignment
//
//  Created by Yusuf Demirkoparan on 27.01.2024.
//

import Foundation

class ResourceLoader {
    static func loadFile() throws -> Data {
        let bundle = Bundle.test

        if let url = bundle.url(forResource: "PopularMoviesMock", withExtension: "json").unwrap() {
            let data = try Data(contentsOf: url)

            return data
        }

        return Data()
    }
}

private extension Bundle {
    class Dummy { }
    
    static let test = Bundle(for: Dummy.self)
}
