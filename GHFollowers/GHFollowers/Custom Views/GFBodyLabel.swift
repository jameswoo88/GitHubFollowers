//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by James Chun on 11/10/21.
//

import UIKit

class GFBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.textColor                 = .secondaryLabel
        self.font                      = UIFont.preferredFont(forTextStyle: .body)
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor        = 0.75
        self.lineBreakMode             = .byWordWrapping
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}//End of class
