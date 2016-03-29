//
//  MovieCell.swift
//  favMovies
//
//  Created by Chris Hovey on 3/28/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var imdbLink: UIButton!
    
    var link = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    func configureCell(movie: Movie){
        movieTitle.text = movie.title
        movieDesc.text = movie.whyILiked
        movieImg.image = movie.getMovieImage()
        if movie.imdbUrl != "" {
            link = movie.imdbUrl!
        } else {
            link = "imdb.com"
        }
    }
    
    @IBAction func imdbLinkBtn(sender: AnyObject){
        if let url = NSURL(string: "http://\(link)"){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
