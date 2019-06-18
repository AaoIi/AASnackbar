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
    @IBOutlet fileprivate weak var label: UILabel!
    @IBOutlet fileprivate weak var button: UIButton!{
        didSet{
            button.isHidden = true
        }
    }
    @IBOutlet private var contentView:UIView!
    @IBOutlet private weak var parentView:UIView!

    fileprivate var timer : Timer!
    fileprivate var animationType : Type!
    enum `Type`:Int{
        case fade = 0 , translation = 1
    }
    
    //MARK:- Customization
    static var barHeight : CGFloat = 100
    
    // MARK: Constructors init
    
    init(addedToView: UIView,title:String,buttonTitle:String,duration:TimeInterval,animationType:Type) {
        super.init(frame: addedToView.frame)
        commonInit()
        self.parentView = addedToView
        self.animationType = animationType
        self.showAASnackBar(title,withButton: true,buttonTitle: buttonTitle,duration: duration,animationType:animationType)
    }
    
    init(addedToView: UIView,title:String,duration:TimeInterval,animationType:Type) {
        super.init(frame: addedToView.frame)
        commonInit()
        self.parentView = addedToView
        self.animationType = animationType
        self.showAASnackBar(title,withButton: false,buttonTitle: "",duration: duration,animationType:animationType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("AASnackbar", owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    // MARK: AASnackbar initialization
    
    fileprivate func showAASnackBar(_ textTitle:String,withButton:Bool,buttonTitle:String,duration:TimeInterval,animationType:Type){
        
        var safeAreaBottomPadding : CGFloat? = 0
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            safeAreaBottomPadding = window?.safeAreaInsets.bottom
        }
        self.frame = CGRect(x: 0 , y: (self.frame.size.height) - AASnackbar.barHeight - (safeAreaBottomPadding ?? 0), width: self.frame.size.width, height: AASnackbar.barHeight)
        
        contentView.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        
        // Create label
        label.text = textTitle
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        
        // Create button
        if withButton == true {
            
            button.isHidden = false
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0), for: .normal)
            button.addTarget(self, action: #selector(AASnackbar.invalidateTimer(_:)), for: .touchUpInside)
            
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
    
    func show(){
        parentView.addSubview(self)
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
        self.button.setTitleColor(color, for: .normal)
    }
    
    func addButtonAction(_ selector:Selector,view:UIViewController){
        
        self.button.addTarget(view, action: selector, for: .touchUpInside)
        
    }
    
    
    // MARK: Hide Actions
    
    func hideWithTranslation(_ duration:TimeInterval = 1,delay:TimeInterval = 0){
        
        UIView.animate(withDuration: duration
            , delay: delay, options: [], animations: { () -> Void in
                
                self.transform = CGAffineTransform(translationX: 0, y: 500)
                
        }) { (finished) -> Void in
            self.removeFromSuperview()
            self.parentView = nil
        }
    }
    
    func hideWithFade(_ duration:TimeInterval = 1,delay:TimeInterval = 0){
        
        UIView.animate(withDuration: duration
            , delay: delay, options: [], animations: { () -> Void in
                
                self.alpha = 0.0
                
        }) { (finished) -> Void in
            self.removeFromSuperview()
            self.parentView = nil
        }
    }
    
    
    
}
