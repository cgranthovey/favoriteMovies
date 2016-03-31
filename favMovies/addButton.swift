//
//  addButton.swift
//  favMovies
//
//  Created by Chris Hovey on 3/31/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class addButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        

    }

}
