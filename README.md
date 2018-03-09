# RMSpriteButton
[![Build Status](https://travis-ci.org/rogermolas/RMSpriteButton.svg?branch=master)](https://travis-ci.org/rogermolas/RMSpriteButton)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg?style=flat) [![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](https://github.com/rogermolas/RMSpriteButton/blob/master/LICENSE)
[![Contact](https://img.shields.io/badge/contact-@roger_molas-yellowgreen.svg?style=flat)](https://twitter.com/roger_molas)
[![Version](https://img.shields.io/cocoapods/v/RMSpriteButton.svg?style=flat)](http://cocoapods.org/pods/RMSpriteButton)

UIButton like control for SpriteKit, it is use background image for state selected and and highlighted.

## Installation

RMSpriteButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RMSpriteButton"
```

Run the following command in your Terminal
```bash
$ pod install
```

### Using background color
```swift
let button = RMSpriteButton(title: "My Title", backgroundColor: UIColor.blueColor())
    button.size = CGSizeMake(200, 100)
    button.addTarget(self, selector:Selector("call:"), object:self)
    button.position = CGPoint(x:CGRectGetWidth(self.frame) / 2, y:CGRectGetHeight(self.frame) / 2);
    self.addChild(button)
```

### Using background image
```swift
let button = RMSpriteButton(image: "test_button")
    button.size = CGSizeMake(200, 100)
    button.addTarget(self, selector:Selector("call:"), object:self)
    button.position = CGPoint(x:CGRectGetWidth(self.frame) / 2, y:CGRectGetHeight(self.frame) / 2);
    self.addChild(button)
```

## Author

rogermolas, contact@rogermolas.com

## License

The MIT License (MIT)

Copyright (c) 2017 Roger Molas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
