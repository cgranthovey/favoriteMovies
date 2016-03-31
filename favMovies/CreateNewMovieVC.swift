//
//  CreateNewMovieVC.swift
//  favMovies
//
//  Created by Chris Hovey on 3/28/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit
import CoreData

class CreateNewMovieVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var imdbURL: UITextField!
    @IBOutlet weak var imdbPlot: UITextView!
    @IBOutlet weak var addMovie: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        movieImage.layer.cornerRadius = 4
        movieImage.clipsToBounds = true
        
    }

    @IBAction func addImage(sender: AnyObject!){
        sender.setTitle("", forState: .Normal)
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImage.image = image
    }
    
    @IBAction func createMovie(sender: AnyObject!){
        if let title = movieTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            
            movie.title = title
            movie.setMovieImage(movieImage.image!)
            movie.whyILiked = movieDesc.text
            movie.imdbPlot = imdbPlot.text
            movie.imdbUrl = imdbURL.text
            
            context.insertObject(movie)
            
            do{
                try context.save()
            } catch{
                print("recipe could not save")
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    

}





















