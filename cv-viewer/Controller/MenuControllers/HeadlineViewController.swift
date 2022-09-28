//
//  HeaderViewController.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/19/22.
//

import UIKit

class HeadlineViewController: UIViewController {
    private let headlineView = HeadlineView()
    
    var headline: Headline?
    
    var headlineManager: HeadlineManageable = HeadlineManager()

    let hvc = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Headline"
        setupView()
        fetchData()

    }
    
    private func setupView() {
        view.addSubview(headlineView)
        
        headlineView.centerX(inView: view.self)
        
    }

    private func fetchData() {
        headlineManager.fetchHeadline { result in
            switch result {
            case .success(let headline):
                self.headline = headline
                self.configureLabels(with: headline)
            case .failure(let error):
                self.hvc.displayError(error)
            }
        }
        
      
    }

    private func configureLabels(with headline: Headline) {
        let vm = HeadlineViewModel(fullName: headline.headline.myName, address: headline.headline.address, phone: headline.headline.phone, email: headline.headline.email, link: headline.headline.github)
        headlineView.populateLabels(viewModel: vm)
    }
    

    
    

}

// Extension for unit testing

extension HeadlineViewController {
    func titleAndMessageForTesting(for error: NetworkError) -> (String, String) {
        return hvc.titleAndMessage(for: error)
    }
    
    func forceFetchHeadline() {
        fetchData()
    }
}
