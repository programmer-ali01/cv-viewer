//
//  Projects.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/23/22.
//

import UIKit

class ProjectsView: UICollectionViewCell {
  
    
    private lazy var projectName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var projectDesc: UITextView = {
        let textView = UITextView(frame: CGRect(x:0, y:0, width: 350, height:100))
        textView.font = .systemFont(ofSize: 14)
        textView.textAlignment = .left
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.backgroundColor = .aliceBlue
        textView.isEditable = false
        return textView
    }()
    
    private lazy var projectLink: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .aliceBlue
        
        let stackView = UIStackView(arrangedSubviews: [projectName, projectDesc, projectLink ])
              addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
              stackView.axis = .vertical
              stackView.spacing = 10
    }
    
    func populateLabels(viewModel: ProjectsViewModel) {
        projectName.text = "project name: " + viewModel.projectName
        projectDesc.text = "description: \r\n \r\n " + viewModel.projectDesc
        projectLink.text = "link: " + viewModel.projectLink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
