//
//  SummaryManager.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation

protocol SummaryManageable: AnyObject {
    func fetchSummary(completion: @escaping(Result<Summary, NetworkError>) -> Void)
}

class SummaryManager: SummaryManageable {
    
    func fetchSummary(completion: @escaping (Result<Summary, NetworkError>) -> Void) {
        let url = URL(string: "https://programmer-ali01.github.io/data/myCV.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                do {
                    let summary = try JSONDecoder().decode(Summary.self, from: data)
                    completion(.success(summary))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
        }.resume()
        
    }
}
