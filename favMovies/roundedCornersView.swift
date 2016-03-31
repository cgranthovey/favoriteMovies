//
//  roundedCornersView.swift
//  favMovies
//
//  Created by Chris Hovey on 3/29/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class roundedCornersView: UIView {


    override func drawRect(rect: CGRect) {
        self.layer.cornerRadius = 7
        self.clipsToBounds = true
    }
    

}
