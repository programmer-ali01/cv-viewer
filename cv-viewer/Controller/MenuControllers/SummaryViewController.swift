//
//  SummaryViewController.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/19/22.
//

import UIKit

class SummaryViewController: UIViewController {
    
    private let summaryView = SummaryView()

    var summary: Summary?

    var summaryManager: SummaryManageable = SummaryManager()
    
    let hvc = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Summary"
        
        setupView()
        fetchData()
    }
    
    
    private func setupView() {
        view.addSubview(summaryView)
        summaryView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 50)
        summaryView.centerX(inView: view.self)
    }

    
    private func fetchData() {
        summaryManager.fetchSummary { result in
            switch result {
            case .success(let summary):
                self.summary = summary
                self.configureLabels(with: summary)
            case .failure(let error):
                self.hvc.displayError(error)
            }
        }
        
      
    }

    private func configureLabels(with summary: Summary) {
        let vm = SummaryViewModel(summary: summary.summary)
        summaryView.populateSummary(viewModel: vm)
    }
}

extension SummaryViewController {
    func titleAndMessageForTesting(for error: NetworkError) -> (String, String) {
        return hvc.titleAndMessage(for: error)
    }
    
    func forceFetchSummary() {
        fetchData()
    }
}
