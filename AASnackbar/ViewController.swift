//
//  ViewController.swift
//  AASnackbar
//
//  Created by AaoIi on 11/29/15.
//  Copyright © 2015 Saad Albasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var snackBar : AASnackbar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Show Snackbar without action by only setting the button to be hidden.
    
    @IBAction func showSnackbar(sender: AnyObject) {
        
        snackBar = AASnackbar(frame: self.view.frame, title: "No internet connection", duration: 3.0,animationType:.Fade)
        snackBar.setTextColor(UIColor.whiteColor())
        self.view.addSubview(snackBar)

    }
    
    // Show Snackbar with action .
    
    @IBAction func showSnackbarWithAction(sender: AnyObject) {
        
        snackBar = AASnackbar(frame: self.view.frame, title: "No Internet connection",buttonTitle: "OK", duration: 3.0,animationType: .Translation)
        snackBar.setButtonTextColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0))
        snackBar.addButtonAction("showAlert:", view: self)
        self.view.addSubview(snackBar)
        
    }
    
    // Action for the button

    func showAlert(sender:AnyObject){
        
        let alert = UIAlertController(title: "Do any action!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(okButton)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }


    // Hide SnackBar

    @IBAction func hideSnackbar(sender: AnyObject) {
        
        snackBar.hideWithFade(0.5, delay: 0.0)
        
    }



}

