//
//  Post.swift
//  SwiftUI-Fetch-Post-Learn
//
//  Created by Subhrajyoti Chakraborty on 26/10/20.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

struct Posts: Codable {
    var posts: [Post]
}
