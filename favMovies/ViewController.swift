//
//  ViewController.swift
//  favMovies
//
//  Created by Chris Hovey on 3/28/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self       //since we implemented protocols we have to set the delegates
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do{
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell{
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        } else{
            return MovieCell()
        }
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            context.deleteObject(movies[indexPath.row] as NSManagedObject)
            movies.removeAtIndex(indexPath.row)
            do{
                try context.save()
            } catch let err as NSError{
                print(err.debugDescription)
            }
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let passMovie = movies[indexPath.row]
        self.performSegueWithIdentifier("toDetails", sender: passMovie)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetails"{
            if let viewController1 = segue.destinationViewController as? MovieDetailsVC{
                if let movie1 = sender as? Movie{
                    viewController1.movie = movie1
                }
            }
        }
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

