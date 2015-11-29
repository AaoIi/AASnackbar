//
//  AASnackbar.swift
//  AASnackbar
//
//  Created by AaoIi on 11/26/15.
//  Copyright © 2015 Saad Albasha. All rights reserved.
//

import UIKit

class AASnackbar: UIView {
    
    // MARK: private properties
    private var label : UILabel!
    private var button : UIButton!
    private var duration : NSTimeInterval = 4.0
    private var timer : NSTimer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.showAASnackBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.showAASnackBar()
    }
    
    // MARK: AASnackbar initialization
    
    private func showAASnackBar(){
        
        self.frame = CGRect(x: 0 , y: self.frame.size.height-66, width: self.frame.size.width, height: 66)
        self.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        
        // create label
        label = UILabel(frame: CGRect(x: 20, y: 8, width: self.frame.size.width-90, height: 50))
        label.text = "Connection error please try again later!!"
        label.textColor = UIColor.whiteColor()
        label.numberOfLines = 0
        label.font = UIFont.systemFontOfSize(14)
        self.addSubview(label)
        
        // create button
        button = UIButton(frame: CGRect(x: self.frame.size.width-87, y: 8, width: 86, height: 50))
        button.setTitle("OK", forState: UIControlState.Normal)
        button.setTitleColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0), forState: UIControlState.Normal)
        button.addTarget(self, action: "invalidateTimer:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(button)
        
        // set and animate transform translation animation from the bottom
        
        self.transform = CGAffineTransformMakeTranslation(0, 500)
        UIView.animateWithDuration(1.0, delay: 0.0, options: [], animations: { () -> Void in
            
            self.transform = CGAffineTransformIdentity
            
            }) { (finished) -> Void in
                
                self.timer =  NSTimer.scheduledTimerWithTimeInterval(self.duration, target: self, selector: "invalidateTimer:", userInfo: nil, repeats: false)
        }
        
    }
    
    @objc private func invalidateTimer(sender:AnyObject){
        
        if let timer = sender as? NSTimer {
            timer.invalidate()
        }
        
        hide(1.0, delay: 0.0)
        
    }
    
    // MARK: Property setters
    
    func setTextTitle(title:String){
        self.label.text = title
    }
    
    func setTextColor(color:UIColor){
        self.label.textColor = color
    }
    

    func setButtonTitle(title:String){
        self.button.setTitle(title, forState: UIControlState.Normal)
    }
    
    func setButtonTextColor(color:UIColor){
        self.button.setTitleColor(color, forState: UIControlState.Normal)
    }
    
    func setDuration(duration:NSTimeInterval){
        self.duration = duration
    }

    func hideButton(hidden:Bool){
        self.button.hidden = hidden
    }
    
    func addButtonAction(selector:Selector,view:UIViewController){
    
        self.button.addTarget(view, action: selector, forControlEvents: UIControlEvents.TouchUpInside)
    
    }
    
    // MARK: Actions
    
    func hide(duration:NSTimeInterval,delay:NSTimeInterval){
        
        UIView.animateWithDuration(duration
            , delay: delay, options: [], animations: { () -> Void in
                
                self.transform = CGAffineTransformMakeTranslation(0, 500)
                
            }) { (finished) -> Void in
                
                self.removeFromSuperview()
        }
    }
    
}
