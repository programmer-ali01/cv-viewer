//
//  ProjectsManager.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation

protocol ProjectsManageable: AnyObject {
    func fetchProjects(completion: @escaping(Result<Projects, NetworkError>) -> Void)
}

class ProjectsManager: ProjectsManageable {
    
    func fetchProjects(completion: @escaping (Result<Projects, NetworkError>) -> Void) {
        let url = URL(string: "https://programmer-ali01.github.io/data/myCV.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                do {
                    let projects = try JSONDecoder().decode(Projects.self, from: data)
                    completion(.success(projects))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
            
        }.resume()
        
    }
}
