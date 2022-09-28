//
//  Summary.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/22/22.
//

import UIKit

class SummaryView: UIView {
    
    
    
    private lazy var summaryText: UITextView = {
        let textView = UITextView(frame: CGRect(x:0, y:0, width: 350, height: 500))
        textView.font = .systemFont(ofSize: 15)
        textView.textAlignment = .left
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    private func setupView() {
        addSubview(summaryText)
        summaryText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
      
    }
    
    func populateSummary(viewModel: SummaryViewModel) {
        summaryText.text = viewModel.summary
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
    
}
