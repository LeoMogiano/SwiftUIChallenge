//
//  Mission.swift
//  Moonshot
//
//  Created by Leo Mogiano on 28/11/24.
//

import Foundation

struct Mission: Codable, Identifiable{
    
    struct CrewMember: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let crew: [CrewMember]
    let description: String
    let launchDate: Date?
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted ) ?? "N/A"
    }
}



