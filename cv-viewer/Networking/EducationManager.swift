//
//  EducationManager.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation


protocol EducationManageable: AnyObject {
    func fetchEducation(completion: @escaping(Result<Education, NetworkError>) -> Void)
}

class EducationManager: EducationManageable {
    
    func fetchEducation(completion: @escaping (Result<Education, NetworkError>) -> Void) {
        let url = URL(string: "https://programmer-ali01.github.io/data/myCV.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                do {
                    let education = try JSONDecoder().decode(Education.self, from: data)
                    completion(.success(education))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
        }.resume()
        
    }
}
