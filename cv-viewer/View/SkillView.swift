//
//  Skill.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/25/22.
//

import UIKit

class SkillView: UITableViewCell {
    
  
    
    private lazy var skillLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
      
      }
    
    private func setupView() {
        addSubview(skillLabel)
        skillLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 20)
    }
    
    func populateLabel(viewModel: SkillsViewModel) {
        skillLabel.text = viewModel.skillLabel
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
