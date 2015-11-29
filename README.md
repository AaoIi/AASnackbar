# AASnackbar for IOS

## Description
AASnackbar shows a short animated message at the bottom of the screen about Specific event with duration.

## Preview Demo
<img src="https://lh3.googleusercontent.com/XFXSADrx5M_CmE-NjJDZ1RLcpnrxL-GMMJgBF_igZAony6KQMUNCYA=w373-h642-p-b1-c0x00999999">

## How to use AASnackbar ##
##### 1) import ```AASnackbar.swift``` into your project <br/>
#####2) Create object from AASnackbar ```var snackBar = AASnackbar()``` <br/>
#####3) Show AASnackbar:<br/><br/>     3.1) Without action:<br/>

        // send the current view frame and set the text with duration, the button is hidden thus there is no action.
        snackBar = AASnackbar(frame: self.view.frame)
        snackBar.setTextTitle("No internet connection")
        snackBar.setDuration(3)
        snackBar.hideButton(true)
        self.view.addSubview(snackBar)
        
##### 3.2) With action:<br/> 

       // send the current view frame and set the text with duration, the button by default is showen we may customize it and add an action into it.
        snackBar = AASnackbar(frame: self.view.frame)
        snackBar.setTextTitle("No Internet connection")
        snackBar.setDuration(3)
        snackBar.setButtonTitle("OK")
        snackBar.addButtonAction("showAlert:", view: self)
        self.view.addSubview(snackBar)
        
##### 4) Hide AASnackbar (optional):<br/> 

        // By default snackbar has duration to show and hide itself,this can be used to force hiding snackbar while its currently showing.
        snackBar.hide(1.0, delay: 0.0)


##Customization ##
This is all the properties in AASnackbar the you will be able to customize from your base view controller.

#### 1) Background Color<br/>
        backgroundColor = UIColor
        
#### 2) Text Color and Title<br/>
        setTextTitle("sometext")
        setTextColor(UIColor)
        
#### 3) Button Text Color and Title and Action<br/>
        setButtonTitle("sometext")
        setButtonTextColor(UIColor)
        addButtonAction(selector, view: UIViewController)


#### 4) Set Button hidden (true = no Action)<br/>
        hideButton(Bool)

#### 5) Show Duration<br/>
        setDuration(NSTimeInterval)

#### 6) Show Duration<br/>
        hide(duration: NSTimeInterval, delay: NSTimeInterval)

## Requierments ##
* Swift 1.2+
* IOS 7.0+

## License ##

The MIT License (MIT)

Copyright (c) AaoIi 2015

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
