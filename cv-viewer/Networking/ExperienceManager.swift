//
//  ExperienceManager.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation


protocol ExperienceManageable: AnyObject {
    func fetchExperience(completion: @escaping(Result<Experience, NetworkError>) -> Void)
}

class ExperienceManager: ExperienceManageable {
    
    func fetchExperience(completion: @escaping (Result<Experience, NetworkError>) -> Void) {
        let url = URL(string: "https://programmer-ali01.github.io/data/myCV.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                do {
                    let experience = try JSONDecoder().decode(Experience.self, from: data)
                    completion(.success(experience))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
        }.resume()
        
    }
}
