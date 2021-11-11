//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by James Chun on 11/11/21.
//

import Foundation

class NetworkManager {
    //MARK: - Properties
    static let shared = NetworkManager()
    
    let baseURL = "https://api.github.com"
    let userComponent = "users"
    let followerComponent = "followers"
    let perPageKey = "per_page"
    let perPageValue = "100"
    let pageKey = "page"
    
    //MARK: - Init
    private init() {}
    
    //MARK: - Methods
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let baseURL = URL(string: baseURL) else {
            completed(.failure(.invalidBaseURL))
            return
        }
        
        let userURL = baseURL.appendingPathComponent(userComponent)
        let usernameURL = userURL.appendingPathComponent(username)
        let followerURL = usernameURL.appendingPathComponent(followerComponent)
        
        var components = URLComponents(url: followerURL, resolvingAgainstBaseURL: true)
        let perPageQuery = URLQueryItem(name: perPageKey, value: perPageValue)
        let pageQuery = URLQueryItem(name: pageKey, value: String(page))
        
        components?.queryItems = [perPageQuery,pageQuery]
                
        guard let finalURL = components?.url else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }//end of func
    
}//End of class
