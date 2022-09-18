//
//  PostData.swift
//  H4XOR NEWS
//
//  Created by Vlad Katsubo on 18.09.22.
//

import Foundation

struct Results: Decodable {
    var hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
