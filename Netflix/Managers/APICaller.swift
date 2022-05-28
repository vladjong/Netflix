//
//  APICaller.swift
//  Netflix
//
//  Created by Владислав Гайденко on 28.05.2022.
//

import Foundation

struct Constants {
    static let API_KEY = "k_9vvyte1a"
    static let BASE_URL = "https://imdb-api.com/en/API"
}

enum APIError:Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/MostPopularMovies/\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let items = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(items.items))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTV(completion: @escaping (Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/MostPopularTVs/\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let items = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                completion(.success(items.items))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/Top250Movies/\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let items = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(items.items))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func getComingSoonMovies(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/ComingSoon/\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let items = try JSONDecoder().decode(ComingSoonResponse.self, from: data)
                print(items)
//                completion(.success(items.items))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}