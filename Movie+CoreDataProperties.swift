//
//  Movie+CoreDataProperties.swift
//  favMovies
//
//  Created by Chris Hovey on 3/28/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var whyILiked: String?
    @NSManaged var imdbUrl: String?
    @NSManaged var imdbPlot: String?

}
