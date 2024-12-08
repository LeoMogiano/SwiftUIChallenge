//
//  Response.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 8/12/24.
//


struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}