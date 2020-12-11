//
//  User.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import Foundation

struct ResponseUser: Decodable {
    let items: [Repo]
}

struct Repo: Decodable {
    let name: String
    let owner: Owner
    let stargazers_count: Int
}

struct Owner: Decodable {
    let id: Int
    let login: String
    let avatar_url: String
    let repos_url: String
}

struct Commit: Codable {
    let commit: CommitData
}

struct CommitData: Codable {
    let author: Author
    let message: Message
}

struct Author: Codable {
    let name: String
    let email: String
    let date: Date
}

struct Message: Codable {
    let message: String
}
