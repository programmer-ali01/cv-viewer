//
//  Headline.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/22/22.
//

import UIKit

class HeadlineView: UIView {
    private lazy var fullName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var address: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var phone: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var email: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var link: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
    
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }

    private func setupView() {
        addSubview(fullName)
        fullName.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, paddingTop: 30)
        fullName.centerX(inView: self)
        
        let stack = UIStackView(arrangedSubviews: [ address, phone,  email, link ])
        
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .leading
        
        addSubview(stack)
        stack.anchor(top: fullName.bottomAnchor, paddingTop: 30)
        stack.centerX(inView: self)
        
    }
    
    func populateLabels(viewModel: HeadlineViewModel) {
        fullName.text = viewModel.fullName
        address.text = "Address: " + viewModel.address
        phone.text = "Phone: " + viewModel.phone
        email.text = "Email: " + viewModel.email
        link.text = "Github: " + viewModel.link
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
