//
//  Movie.swift
//  favMovies
//
//  Created by Chris Hovey on 3/28/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    func setMovieImage(img: UIImage){
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
    
}
