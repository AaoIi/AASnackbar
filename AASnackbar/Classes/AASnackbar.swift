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
    fileprivate var label : UILabel!
    fileprivate var button : UIButton!
    fileprivate var timer : Timer!
    fileprivate var animationType : Type!
    enum `Type`:Int{
        case fade = 0 , translation = 1
    }
    
    // MARK: Constructors init
    
    init(frame: CGRect,title:String,buttonTitle:String,duration:TimeInterval,animationType:Type) {
        super.init(frame: frame)
        self.animationType = animationType
        self.showAASnackBar(title,withButton: true,buttonTitle: buttonTitle,duration: duration,animationType:animationType)
    }
    
    init(frame: CGRect,title:String,duration:TimeInterval,animationType:Type) {
        super.init(frame: frame)
        self.animationType = animationType
        self.showAASnackBar(title,withButton: false,buttonTitle: "",duration: duration,animationType:animationType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: AASnackbar initialization
    
    fileprivate func showAASnackBar(_ textTitle:String,withButton:Bool,buttonTitle:String,duration:TimeInterval,animationType:Type){

        
        self.frame = CGRect(x: 0 , y: self.frame.size.height-66, width: self.frame.size.width, height: 66)
        self.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        
        // Create label
        label = UILabel(frame: CGRect(x: 20, y: 8, width: self.frame.size.width-90, height: 50))
        label.text = textTitle
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        super.addSubview(label)
        
        // Create button
        if withButton == true {
            
            button = UIButton(frame: CGRect(x: self.frame.size.width-87, y: 8, width: 86, height: 50))
            button.setTitle(buttonTitle, for: UIControlState())
            button.setTitleColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0), for: UIControlState())
            button.addTarget(self, action: #selector(AASnackbar.invalidateTimer(_:)), for: UIControlEvents.touchUpInside)
            self.addSubview(button)
            
        }
        
        // Set and animate translation animation
        if animationType == .translation {
            self.transform = CGAffineTransform(translationX: 0, y: 500)
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: { () -> Void in
                
                self.transform = CGAffineTransform.identity

                }) { (finished) -> Void in
                    
                    self.timer =  Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(AASnackbar.invalidateTimer(_:)), userInfo: nil, repeats: false)
            }
        }else {
            // Set and animate fade animation
            self.alpha = 0.0
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: { () -> Void in
                
                self.alpha = 1.0
                
                }) { (finished) -> Void in
                    
                    self.timer =  Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(AASnackbar.invalidateTimer(_:)), userInfo: nil, repeats: false)
            }
            
        }
        
        
    }
    
    @objc fileprivate func invalidateTimer(_ sender:AnyObject){
        
        if let timer = sender as? Timer {
            timer.invalidate()
        }
        
        if animationType == .translation {
            hideWithTranslation(1.0, delay: 0.0)
        }else {
            hideWithFade(1.0, delay: 0.0)
        }
    }
    
    // MARK: Property setters
    
    func setTextColor(_ color:UIColor){
        self.label.textColor = color
    }
    
    func setButtonTextColor(_ color:UIColor){
        self.button.setTitleColor(color, for: UIControlState())
    }
    
    func addButtonAction(_ selector:Selector,view:UIViewController){
        
        self.button.addTarget(view, action: selector, for: UIControlEvents.touchUpInside)
        
    }
    
    
    // MARK: Hide Actions
    
    func hideWithTranslation(_ duration:TimeInterval,delay:TimeInterval){
        
        UIView.animate(withDuration: duration
            , delay: delay, options: [], animations: { () -> Void in
                
                self.transform = CGAffineTransform(translationX: 0, y: 500)
                
            }) { (finished) -> Void in
                self.removeFromSuperview()
        }
    }
    
    func hideWithFade(_ duration:TimeInterval,delay:TimeInterval){
        
        UIView.animate(withDuration: duration
            , delay: delay, options: [], animations: { () -> Void in
                
                self.alpha = 0.0
                
            }) { (finished) -> Void in
                self.removeFromSuperview()
        }
    }
    
    
    
}
