//
//  Request.swift
//  Prography_6th_iOS
//
//  Created by 서재훈 on 2020/03/01.
//  Copyright © 2020 서재훈. All rights reserved.
//

import Foundation

let DidReceiveMoivesNoti: Notification.Name = Notification.Name("DidReceivedMovies")

let baseURL: String = "https://yts.lt/api/v2/list_movies.json?"
var sortOption: Int = 0
var idOption: String!

func requestMovies(minimumRating: Int) {
    print("requestMovies, minimumRating : ", minimumRating )
    guard let url: URL = URL(string: baseURL + "minimum_rating=" + String(minimumRating) + "&limit=10") else { return }
    let session: URLSession = URLSession(configuration: .default)
    
    let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let data = data else { return }
        
        do {    //APIResponse 형식으로 디코드
            let movieResponse: MovieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
            
            if let movies = movieResponse.data?.movies {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: DidReceiveMoivesNoti, object: nil, userInfo: ["movies":movies])
                }
            }
        } catch(let err) {
            print("check")
            print(err.localizedDescription)
        }
    }
    
    dataTask.resume()   //실행
}
