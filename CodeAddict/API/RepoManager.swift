//
//  RepoManager.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 11/12/2020.
//

import Foundation

struct gitHubRequest {
    let resourceURL: URL
    let path = "search/repositories"
    
    init(name: String ) {
        let urlString = "https://api.github.com/\(path)?q=\(name)"
        guard let resourceURL = URL(string: urlString) else { fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getUsers(completion: @escaping(Result<[Repo], APIError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.invalidUsername))
                return
            }
            do {
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode(ResponseUser.self, from: jsonData)
                let userDetails = userResponse.items
                completion(.success(userDetails))
            } catch{
                completion(.failure(.invalidData))
            }
        }
        dataTask.resume()
    }
}
