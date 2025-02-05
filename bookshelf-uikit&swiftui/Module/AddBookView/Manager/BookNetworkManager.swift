//  BookNetworkManager.swift
//  Created by user on 05/02/2025.

import Foundation

class BookNetworkManager {
    let url = "https://openlibrary.org/search.json?"
    
    /// https://openlibrary.org/search.json?
    /// q=убить пересмешника
    /// &fields=title,author_name,cover_i,subtitle,number_of_pages_median,first_publish_year,ratings_count
    /// &lang=ru
    
    func searchBookRequest(q: String, completion: @escaping (Result<[BookModelItem], Error>) -> Void) {
        
        // Собираем URLSession
        var urlComponent = URLComponents(string: url)
        urlComponent?.queryItems = [
            URLQueryItem(name: "q", value: q),
            URLQueryItem(name: "fields", value: "title,author_name,cover_i,number_of_pages_median,first_publish_year,ratings_count"),
            URLQueryItem(name: "lang", value: "ru")
        ]
        
        
        
        // Проверяем, получилось ли собрать URL
        guard let url = urlComponent?.url else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            // Проверка, если придет Error
            guard error == nil else {
                print(error!.localizedDescription)
                completion(.failure(error!)) //MARK: Result.failure(error)
                return
            }
            
            // Проверка, если придут Data -> то идем дальше
            guard let data else {
                return
            }
            
            do {
                let books = try JSONDecoder().decode(BookModel.self, from: data)
                completion(.success(books.docs)) //MARK: Result.success
            } catch {
                print(error.localizedDescription)
                completion(.failure(error)) //MARK: Result.failure(error)
            }
            
            print(String(decoding: data, as: UTF8.self))
            
        }.resume()
    }
}
