//
//  MealDetailViewController.swift
//  MealTracker
//
//  Created by Mona Shamsolebad on 2019-08-27.
//  Copyright © 2019 Mona Shamsolebad. All rights reserved.
//

import UIKit


class MealDetailViewController: UIViewController {
    var meal: Meal?
    private var dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
    }()
    @IBOutlet var photoImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var ratingLabel: UILabel!
    
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var notesLabel: UILabel!
    
    
    fileprivate func updateUI(_ meal: Meal) {
        photoImageView.image = meal.photo
        nameLabel.text = meal.name
        ratingLabel.text = String(meal.rating)
        timeLabel.text = dateFormatter.string(from: meal.timestamp)
        notesLabel.text = meal.notes
        self.title = meal.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let meal = meal {
            updateUI(meal)
            
        }
        
        

    }
    


}
