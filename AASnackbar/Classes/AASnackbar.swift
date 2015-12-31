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
    private var timer : NSTimer!
    private var animationType : Type!
    enum Type:Int{
        case Fade = 0 , Translation = 1
    }
    
    // MARK: Constructors init
    
    init(frame: CGRect,title:String,buttonTitle:String,duration:NSTimeInterval,animationType:Type) {
        super.init(frame: frame)
        self.animationType = animationType
        self.showAASnackBar(title,withButton: true,buttonTitle: buttonTitle,duration: duration,animationType:animationType)
    }
    
    init(frame: CGRect,title:String,duration:NSTimeInterval,animationType:Type) {
        super.init(frame: frame)
        self.animationType = animationType
        self.showAASnackBar(title,withButton: false,buttonTitle: "",duration: duration,animationType:animationType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: AASnackbar initialization
    
    private func showAASnackBar(textTitle:String,withButton:Bool,buttonTitle:String,duration:NSTimeInterval,animationType:Type){

        
        self.frame = CGRect(x: 0 , y: self.frame.size.height-66, width: self.frame.size.width, height: 66)
        self.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        
        // Create label
        label = UILabel(frame: CGRect(x: 20, y: 8, width: self.frame.size.width-90, height: 50))
        label.text = textTitle
        label.textColor = UIColor.whiteColor()
        label.numberOfLines = 0
        label.font = UIFont.systemFontOfSize(14)
        super.addSubview(label)
        
        // Create button
        if withButton == true {
            
            button = UIButton(frame: CGRect(x: self.frame.size.width-87, y: 8, width: 86, height: 50))
            button.setTitle(buttonTitle, forState: UIControlState.Normal)
            button.setTitleColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0), forState: UIControlState.Normal)
            button.addTarget(self, action: "invalidateTimer:", forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(button)
            
        }
        
        // Set and animate translation animation
        if animationType == .Translation {
            self.transform = CGAffineTransformMakeTranslation(0, 500)
            UIView.animateWithDuration(1.0, delay: 0.0, options: [], animations: { () -> Void in
                
                self.transform = CGAffineTransformIdentity

                }) { (finished) -> Void in
                    
                    self.timer =  NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: "invalidateTimer:", userInfo: nil, repeats: false)
            }
        }else {
            // Set and animate fade animation
            self.alpha = 0.0
            UIView.animateWithDuration(1.0, delay: 0.0, options: [], animations: { () -> Void in
                
                self.alpha = 1.0
                
                }) { (finished) -> Void in
                    
                    self.timer =  NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: "invalidateTimer:", userInfo: nil, repeats: false)
            }
            
        }
        
        
    }
    
    @objc private func invalidateTimer(sender:AnyObject){
        
        if let timer = sender as? NSTimer {
            timer.invalidate()
        }
        
        if animationType == .Translation {
            hideWithTranslation(1.0, delay: 0.0)
        }else {
            hideWithFade(1.0, delay: 0.0)
        }
    }
    
    // MARK: Property setters
    
    func setTextColor(color:UIColor){
        self.label.textColor = color
    }
    
    func setButtonTextColor(color:UIColor){
        self.button.setTitleColor(color, forState: UIControlState.Normal)
    }
    
    func addButtonAction(selector:Selector,view:UIViewController){
        
        self.button.addTarget(view, action: selector, forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    
    // MARK: Hide Actions
    
    func hideWithTranslation(duration:NSTimeInterval,delay:NSTimeInterval){
        
        UIView.animateWithDuration(duration
            , delay: delay, options: [], animations: { () -> Void in
                
                self.transform = CGAffineTransformMakeTranslation(0, 500)
                
            }) { (finished) -> Void in
                self.removeFromSuperview()
        }
    }
    
    func hideWithFade(duration:NSTimeInterval,delay:NSTimeInterval){
        
        UIView.animateWithDuration(duration
            , delay: delay, options: [], animations: { () -> Void in
                
                self.alpha = 0.0
                
            }) { (finished) -> Void in
                self.removeFromSuperview()
        }
    }
    
    
    
}
