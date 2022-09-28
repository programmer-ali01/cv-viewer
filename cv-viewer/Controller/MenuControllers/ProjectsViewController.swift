//
//  ProjectsViewController.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/23/22.
//


import UIKit

class ProjectsViewController: UICollectionViewController {

    init() {
          super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private let cellID = "cellID"
    
    let hvc = HomeViewController()
    
    var projects: Projects?
    
    private let projectsView = ProjectsView()
    let projectsManager: ProjectsManageable = ProjectsManager()
    var projectsData = [ProjectDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
        fetchData()
   }
    
    private func setupView() {
        collectionView.register(ProjectsView.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .systemBackground
        title = "Projects"
    }
    
    private func fetchData() {
        projectsManager.fetchProjects { result in
            switch result {
            case .success(let projects):
                self.projects = projects
                self.projectsData = projects.projects
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                   
            case .failure(let error):
                self.hvc.displayError(error)
            }
        }
    }
}

extension ProjectsViewController: UICollectionViewDelegateFlowLayout {
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectsData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ProjectsView
      cell.layer.cornerRadius = 12
        
      let projectsResult = projectsData[indexPath.item]

      let vm = ProjectsViewModel(projectName: projectsResult.name, projectDesc: projectsResult.description, projectLink: projectsResult.link)
      cell.populateLabels(viewModel: vm)
      return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 1, bottom: 10, right: 1)
    }
    
}
