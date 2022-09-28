//
//  HomeViewController.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/17/22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My CV"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var message: UILabel = {
        let label = UILabel()
        label.text = "Please press the side menu to view content of my CV"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    
    lazy var errorAlert: UIAlertController = {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }()

    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        let stack = UIStackView(arrangedSubviews: [titleLabel, message])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.centerX(inView: view.self)
        stack.centerY(inView: view.self)
        
        
        
        view.backgroundColor = .systemBackground
        
        title = "Home"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
    
}

extension HomeViewController {
    func titleAndMessage(for error: NetworkError) -> (String, String) {
        let title: String
        let message: String
        switch error {
        case .serverError:
            title = "Server Error"
            message = "Ensure you are connected to the internet. Please try again."
        case .decodingError:
            title = "Network Error"
            message = "We could not process your request. Please try again."
        }
        return (title, message)
        
    }

    func showErrorAlert(title: String, message: String) {
        errorAlert.title = title
        errorAlert.message = message
        errorAlert.show()
    }

    func displayError(_ error: NetworkError) {
        let titleAndMessage = titleAndMessage(for: error)
        self.showErrorAlert(title: titleAndMessage.0, message: titleAndMessage.1)
    }
  
}

