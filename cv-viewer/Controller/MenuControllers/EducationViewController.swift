//
//  EducationViewController.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/19/22.
//


import UIKit

class EducationViewController: UICollectionViewController {
    
    
    init() {
          super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private let cellID = "cellID"
    
    let hvc = HomeViewController()
    
    var education: Education?
    
    let educationManager: EducationManageable = EducationManager()
    
    var degrees = [DegreeDetails]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchData()
        
    }
    
    private func setupView() {
        collectionView.register(EducationView.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .systemBackground
        title = "Education"
    }
    
    private func fetchData() {
        educationManager.fetchEducation { result in
            switch result {
            case .success(let education):
                self.education = education
                self.degrees = education.education
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                   
            case .failure(let error):
                self.hvc.displayError(error)
            }
        }
    }
}


extension EducationViewController: UICollectionViewDelegateFlowLayout {
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return degrees.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! EducationView
      cell.layer.cornerRadius = 12
        
        let degree = degrees[indexPath.item]

        let vm = EducationViewModel(date: degree.date, subject: degree.subject, place: degree.place, description: degree.description)
      cell.populateLabels(viewModel: vm)
      return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 1, bottom: 10, right: 1)
    }
    
}
