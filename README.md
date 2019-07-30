# AASnackbar

## Latest Update

#### 1.2.1 Release (6/17/2019)

* Support Swift 5.0
* Minor improvements.
* xib design instead of programmatically.
* Safe area is now supported.

#### 1.2 Release (6/15/2017)

* Support Swift 3.0

#### 1.2 Release (7/26/2016)

* Warning fixes.<br/>
* Support Swift 2.2

#### 1.1 Release (12/31/2015)

* Major changes and much easier to use.<br/>
* Bug fixes

## Description
AASnackbar shows a short animated message at the bottom of the screen about Specific event with duration.

## Preview Demo
<img src="https://lh3.googleusercontent.com/qf4BcHD1IgXcQ-NQw4Vx4PwMsyxvgdaGyzgmYZKTKZO7i1V2LHmEUw=w373-h642-p-b1-c0x00999999">

## Installation ##
```pod 'AASnackbar'```

## How to use AASnackbar ##
##### 1) import AASnackbar <br/>
##### 2) Create object from AASnackbar ```var snackBar : AASnackbar!``` <br/>
##### 3) Show AASnackbar:<br/><br/>     

##### 3.1) Without action:

```swift
// send the current view frame and set the text with duration, and animation type fade or translation.
snackBar = AASnackbar(addedToView: self.view, title: "No internet connection", duration: 3.0,animationType:.fade)
snackBar.setTextColor(UIColor.white)
snackBar.show()
        
```
##### 3.2) With action:
```swift

// send the current view frame and set the text with duration, by setting button title makes button visible
snackBar = AASnackbar(addedToView: self.view, title: "No Internet connection",buttonTitle: "OK", duration: 3.0,animationType: .translation)
snackBar.setButtonTextColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0))
snackBar.addButtonAction(#selector(ViewController.showAlert(_:)), view: self)
snackBar.show()
        
```

##### 3.3) Shortcut show:
```swift


AASnackbar(addedToView: self.view, title: "No Internet connection",buttonTitle: "OK", duration: 3.0,animationType: .translation).show()
        
```

##### 4) Hide AASnackbar (optional):

```swift
// By default snackbar has duration to show and hide itself,this can be used to force hiding snackbar while its currently showing. so if you are showing the snackbar with fade then use fade to hide and same for translation.
snackBar.hideWithFade(1.0, delay: 0.0)
snackBar.hideWithTranslation(1.0, delay: 0.0)
```

## Customization ##
This is all the properties in AASnackbar the you will be able to customize from your base view controller.

#### 1) Background Color<br/>
```swift
backgroundColor = UIColor
```
#### 2) Text Color<br/>
```swift
setTextColor(UIColor)
```
#### 3) Button Text Color and Action<br/>
```swift
setButtonTextColor(UIColor)
addButtonAction(selector, view: UIViewController)
```
#### 4) Force hiding<br/>
```swift
hideWithFade(duration: NSTimeInterval, delay: NSTimeInterval)
hideWithTranslation(duration: NSTimeInterval, delay: NSTimeInterval)
```

#### 5) Bar Height<br/>
```swift
barHeight = 60
```

## Requirements ##
* Swift 5.0+
* IOS 7.0+

## License ##

The MIT License (MIT)

Copyright (c) AaoIi 2015

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
