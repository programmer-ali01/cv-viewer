//
//  HeadlineManager.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation

protocol HeadlineManageable: AnyObject {
    func fetchHeadline(completion: @escaping(Result<Headline, NetworkError>) -> Void)
}

class HeadlineManager: HeadlineManageable {
    func fetchHeadline(completion: @escaping (Result<Headline, NetworkError>) -> Void) {
        let url = URL(string: "https://programmer-ali01.github.io/data/myCV.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                do {
                    let headline = try JSONDecoder().decode(Headline.self, from: data)
                    completion(.success(headline))
                    
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
        }.resume()
        
    }
}
