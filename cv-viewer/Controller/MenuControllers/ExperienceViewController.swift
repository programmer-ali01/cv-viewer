//
//  ExperienceViewController.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/19/22.
//


import UIKit

class ExperienceViewController: UICollectionViewController {
    
    init() {
          super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private let cellID = "cellID"
    
    let hvc = HomeViewController()
    
    var experience: Experience?
    
    let experienceManager: ExperienceManageable = ExperienceManager()
    
    var roles = [Roles]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        fetchData()
    
    }
    
    private func setupView() {
        collectionView.register(ExperienceView.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .systemBackground
        title = "Experience"
    }
    
    
    private func fetchData() {
        experienceManager.fetchExperience { result in
            switch result {
            case .success(let experience):
                self.experience = experience
                self.roles = experience.experience
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                   
            case .failure(let error):
                self.hvc.displayError(error)
            }
        }
    }
    

}


extension ExperienceViewController: UICollectionViewDelegateFlowLayout {
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ExperienceView
      cell.layer.cornerRadius = 12
        
        let role = roles[indexPath.item]
        
        var text = ""
        for i in 0...role.description.count-1 {
            text += "- \(role.description[i])\n"
        }
        let vm = ExperienceViewModel(date: role.date, role: role.role, company: role.company, description: text)
      cell.populateLabels(viewModel: vm)
      return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 1, bottom: 10, right: 1)
    }
    
}
