//
//  ElementSpacer.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/20/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class ElementSpacer: UIView {

    let spacing: CGFloat
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: spacing, height: spacing)
    }
    
    init(_ spacing: CGFloat){
        self.spacing = spacing
        super.init(frame: .zero)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
