//
//  Experience.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/27/22.
//

import UIKit

class ExperienceView: UICollectionViewCell {
    
    private lazy var date: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var role: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var company: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var responsibilities: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.textAlignment = .left
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.backgroundColor = .aliceBlue
        textView.isEditable = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    

    
    private func setupView() {
        backgroundColor = .aliceBlue
        
        let stack = UIStackView(arrangedSubviews: [date, role, company, responsibilities])
        addSubview(stack)
        
        stack.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        stack.axis = .vertical
        stack.spacing = 10
    }
    
    

    
    func populateLabels(viewModel: ExperienceViewModel) {
        date.text = viewModel.date
        role.text = viewModel.role
        company.text = viewModel.company
        responsibilities.text = viewModel.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
