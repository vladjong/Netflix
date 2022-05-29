//
//  APICaller.swift
//  Netflix
//
//  Created by Владислав Гайденко on 28.05.2022.
//

import Foundation

struct Constants {
//    static let API_KEY = "k_9vvyte1a"
    static let API_KEY = "k_1wnlkjaq"
//    static let API_KEY = "k_vbpgnfhs"
    static let BASE_URL = "https://imdb-api.com/en/API"
    static let API_KEY_YOUTUBE = "AIzaSyDkLGDRKL3bQDqesi6tSo4CqRXw8E95-PE"
    static let YOUTUBE_BASE_URL = "https://www.googleapis.com/youtube/v3/search?"
}

enum APIError:Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/MostPopularMovies/\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(items.items))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTV(completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.BASE_URL)/MostPopularTVs/\(Constants.API_KEY)") else {return}
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(items.items))
//            } catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.BASE_URL)/Top250Movies/\(Constants.API_KEY)") else {return}
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(items.items))
//            } catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
    }

    func getComingSoonMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.BASE_URL)/ComingSoon/\(Constants.API_KEY)") else {return}
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(items.items))
//            } catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.BASE_URL)/ComingSoon/\(Constants.API_KEY)") else {return}
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(items.items))
//            } catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }
//        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.YOUTUBE_BASE_URL)q=\(query))&key=\(Constants.API_KEY_YOUTUBE)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let items = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(items.items[0]))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
