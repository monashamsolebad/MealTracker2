//
//  ViewController.swift
//  MealTracker
//
//  Created by Mona Shamsolebad on 2019-08-27.
//  Copyright © 2019 Mona Shamsolebad. All rights reserved.
//

import UIKit

class MealListTableViewController: UITableViewController {
    private var dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
    }()
    var meals : [Meal] = [
        Meal(name: "sashimi", photo: UIImage(named: "sashimi")!, notes: "Raw fish, originated from Japan", rating: 10, timestamp: Date()),
        Meal(name: "churrasco", photo: UIImage(named:"churrasco")!, notes: "Braizilian BBQ", rating: 10, timestamp: Date()),
           Meal(name: "coxinha", photo: UIImage(named:"coxinha")!, notes: "Braizilian snack", rating: 10, timestamp: Date()),
           Meal(name: "feijoada", photo: UIImage(named:"feijoada")!, notes: "Bean with meat stew", rating: 10, timestamp: Date()),
         Meal(name: "kebab", photo: UIImage(named:"kebab")!, notes: "Meat in skweres", rating: 10, timestamp: Date()),
         Meal(name: "kimchi", photo: UIImage(named:"kimchi")!, notes: "fermented Cabbage in red pepper", rating: 10, timestamp: Date()),
          Meal(name: "shiokara", photo: UIImage(named:"shiokara")!, notes: "squids guts", rating: 10, timestamp: Date()),
            Meal(name: "Rulofan", photo: UIImage(named:"mincedporkrice")!, notes: "Taiwanese", rating: 10, timestamp: Date()),
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MealDetail" {
           let destVC = segue.destination as! MealDetailViewController
            if let selectedIndexPath =  tableView.indexPathForSelectedRow {
                
                  destVC.meal = meals[selectedIndexPath.row]
            }
          
        }
    }

    // MARK:- UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // how many cells?
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // for each cell(indexPath) what to display?
        // 1. get the reusablecell from tableView
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        cell.detailTextLabel?.text = dateFormatter.string(from: meal.timestamp)
        cell.imageView?.image = meal.photo
        return cell
    }
}

