//
//  CircleView.swift
//  socialapp
//
//  Created by Viktor Yamchinov on 16/08/2017.
//  Copyright © 2017 Viktor Yamchinov. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
}
