//
//  SkillManager.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation

protocol SkillsManageable: AnyObject {
    func fetchSkills(completion: @escaping(Result<Skills, NetworkError>) -> Void)
}

class SkillsManager: SkillsManageable {
    
    func fetchSkills(completion: @escaping (Result<Skills, NetworkError>) -> Void) {
        let url = URL(string: "https://programmer-ali01.github.io/data/myCV.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                do {
                    let skills = try JSONDecoder().decode(Skills.self, from: data)
                    completion(.success(skills))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
        }.resume()
        
    }
}
