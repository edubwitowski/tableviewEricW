//
//  ViewController.swift
//  tableviewEricW
//
//  Created by Macbook on 2/27/18.
//  Copyright © 2018 Eric Witowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private let dwarves = ["Sleepy", "Sneezy", "Bashful", "Happy", "Doc", "Grumpy", "Dopey", "Thorin", "Dorin", "Nori", "Ori", "Balin", "Dwalin", "Fili", "Kili", "Oin", "Gloin", "Bifur", "Bofur", "Bombur"]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    //MARK:-
    //MARK: Table View Data Source Methods

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dwarves.count
    }
    
    //////////
   //attempt one to move code
    ////////////
    
    
    
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.default,
            reuseIdentifier: simpleTableIdentifier)
        }
        
        //////
        //
        //////
        
        
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr Tolkien"
        }
        
        cell?.textLabel?.text = dwarves[indexPath.row]
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //tabView.rowHeight = 70
        return cell!
    }
    
    //MARK:-
    //MARK: Table View delegate Methods
   
    
    
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) ->
        Int {
            return indexPath.row % 4
    }
    
    //section: listing 8.4 in book
    private func tableView(_ tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.row == 0 {
            return nil
            
        } else if (indexPath.row % 2 == 0) {
            return NSIndexPath(row: indexPath.row + 1, section: indexPath.section)
            
        } else {
            return indexPath
            
        }
        return indexPath.row == 0 ? nil : indexPath
    }
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: NSIndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController(title: "Row Selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I Did", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return indexPath.row == 0 ? 120 : 70

   
        
    }
    
}

    
    
   
 
    
    
    
    
    
    
    
    
    



