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
    
    @IBAction func showSnackbar(_ sender: AnyObject) {
        
        snackBar = AASnackbar(addedToView: self.view, title: "No internet connection", duration: 3.0,animationType:.fade)
        snackBar.setTextColor(UIColor.white)
        snackBar.show()

    }
    
    // Show Snackbar with action .
    
    @IBAction func showSnackbarWithAction(_ sender: AnyObject) {
        
        snackBar = AASnackbar(addedToView: self.view, title: "No Internet connection",buttonTitle: "OK", duration: 3.0,animationType: .translation)
        snackBar.setButtonTextColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0))
        snackBar.addButtonAction(#selector(ViewController.showAlert(_:)), view: self)
        snackBar.show()
        
    }
    
    // Action for the button

    @objc func showAlert(_ sender:AnyObject){
        
        let alert = UIAlertController(title: "Do any action!", message: "", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }


    // Hide SnackBar

    @IBAction func hideSnackbar(_ sender: AnyObject) {
        
        snackBar.hideWithFade(0.5, delay: 0.0)
        
    }



}

