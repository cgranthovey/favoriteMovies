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
//    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    @IBOutlet weak var imdbLink: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var transparentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = movie.title
      //  movieDesc.text = movie.whyILiked
        moviePlot.text = movie.imdbPlot
        image.image = movie.getMovieImage()
        if movie.imdbUrl != ""{
            link = movie.imdbUrl
        } else{
            link = "www.imdb.com"
        }
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
        downSwipe.direction = .Down
        view.addGestureRecognizer(downSwipe)
    }

    func handleSwipe(sender:UISwipeGestureRecognizer){
        if (sender.direction == .Down){
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5, animations: {
            self.transparentView.alpha = 0.75
        })
    }
    
    @IBAction func imdbPress (sender: AnyObject){
        if let url = NSURL(string: "http://\(link)"){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
}
