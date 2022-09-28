//
//  Education.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/27/22.
//

import UIKit

class EducationView: UICollectionViewCell {
    
    private lazy var date: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var subject: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var place: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var degreeDesc: UITextView = {
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
        
        let stack = UIStackView(arrangedSubviews: [date, subject, place, degreeDesc])
        
        
        addSubview(stack)
        
        stack.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        stack.axis = .vertical
        stack.spacing = 10
    }
    
    

    
    func populateLabels(viewModel: EducationViewModel) {
        date.text = viewModel.date
        subject.text = viewModel.subject
        place.text = viewModel.place
        degreeDesc.text = viewModel.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
