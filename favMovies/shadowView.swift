//
//  shadowView.swift
//  favMovies
//
//  Created by Chris Hovey on 3/31/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class shadowView: UIView {

    var shadowLayer: CAShapeLayer!
    
    // Set a size for your button if necessary

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.width / 2).CGPath
            shadowLayer.fillColor = UIColor.whiteColor().CGColor
            
            shadowLayer.shadowColor = UIColor.darkGrayColor().CGColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 2
            
            layer.insertSublayer(shadowLayer, below: nil)
        }
        
        shadowLayer.frame = layer.bounds
    }
}
