//
//  DetailsVC.swift
//  favMovies
//
//  Created by Chris Hovey on 3/29/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {

    
    var movie: Movie!
    var link: String!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    @IBOutlet weak var imdbLink: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(animated: Bool) {
        movieTitle.text = movie.title
        movieDesc.text = movie.whyILiked
        moviePlot.text = movie.imdbPlot
        image.image = movie.getMovieImage()
        if movie.imdbUrl != ""{
            link = movie.imdbUrl
        } else{
            link = "www.imdb.com"
        }
    }
    
    @IBAction func imdbPress (sender: AnyObject){
        if let url = NSURL(string: "http://\(link)"){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
}
