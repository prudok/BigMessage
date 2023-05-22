//
//  Message.swift
//  BigMessage
//
//  Created by home on 22.05.2023.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var recieved: Bool
    var timestamp: Date
}
