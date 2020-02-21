//
//  Genre.swift
//  Moviewer
//
//  Created by Victor Oka on 20/02/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import Foundation

// MARK: - Codable Protocol
class Genre: Codable {
    
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

// MARK: - Identifiable Protocol
extension Genre: Identifiable {}
