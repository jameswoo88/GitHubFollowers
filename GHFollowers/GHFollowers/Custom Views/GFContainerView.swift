//
//  GFContainerView.swift
//  GHFollowers
//
//  Created by James Chun on 11/11/21.
//

import UIKit

class GFContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.layer.cornerRadius = 16
        self.layer.borderWidth  = 2
        self.layer.borderColor  = UIColor.white.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
    }

}//End of class
