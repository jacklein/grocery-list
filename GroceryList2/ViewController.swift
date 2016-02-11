//
//  ViewController.swift
//  GroceryList2
//
//  Created by Jack Klein on 2/10/16.
//  Copyright © 2016 Jack Klein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var item: UITextField!
    @IBOutlet weak var quantity: UITextField!
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var groceryList: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        groceryList.text = ""
        groceryList.numberOfLines = 0
        groceryList.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //'return' key pressed on keyboard
    @IBAction func editEnded(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    //background pressed (for quantity field)
    @IBAction func backgroundTouched(sender: UIControl) {
        for tf in textFields{
            tf.resignFirstResponder()
        }
    }
    
    //old list is erased
    @IBAction func newList(sender: UIButton) {
        groceryList.text=""
    }
    
    @IBAction func newItem(sender: UIButton) {
        for tf in textFields{
            tf.text = ""
        }
    }

    
    //valid item added to grocery list
    @IBAction func addItem(sender: UIButton) {
        var newItem: String
        //checks to see if inputs are valid
        if let num = (Int(quantity.text!)){
            if item.text != ""{
                let i = item.text! ?? ""
                newItem = "\n\(num)x \(i)"
                groceryList.text = (groceryList.text! ?? "") + newItem
                item.text = ""
                quantity.text = ""
                return
            }
        }
        
        //code only reached if invalid input
        let title = "Hold on a Second"
        let message = "Invalid Input, Please Fix Your Entry!"
        let alertController =
        UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        
        // Create the action.
        let cancelAction =
        UIAlertAction(title: "OK",
            style: .Cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        presentViewController(alertController,
            animated: true,
            completion: nil)
    }
}

