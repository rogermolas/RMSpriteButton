/*

 RMSpriteButton.swift

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
*/

import Foundation
import SpriteKit

private let TOUCH_MARGIN: CGFloat        = 10.0
private let TOUCH_UP_SCALE: CGFloat      = 1.25
private let TOUCH_DOWN_SCALE: CGFloat    = 0.8
private let ANIMATION_DURATION: CGFloat  = 0.2

class RMSpriteButton: SKSpriteNode {
    var exclusiveTouch: Bool = true
    fileprivate var selectedImgeName: String?
    fileprivate var highlightedImgeName: String?
    
    fileprivate var selection: UITouch?
    
    fileprivate var target: AnyObject?
    fileprivate var selector: Selector?
    fileprivate var object_param: AnyObject?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Initialize with title
    public init(title:NSString, backgroundColor:UIColor?) {
        var color = backgroundColor;
        if color == nil {
            color = UIColor.gray
        }
        super.init(texture: nil, color: color!, size: CGSize(width: 100, height: 50))
        let titleLabel = SKLabelNode(text: title as String)
        titleLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(titleLabel);
        
        self.name = NSStringFromClass(object_getClass(self))
        self.isUserInteractionEnabled = true
    }

    //MARK: Initialize with texture image
    public init(image:NSString) {
        let texture = SKTexture(imageNamed:image as String)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        self.name = NSStringFromClass(object_getClass(self))
        self.isUserInteractionEnabled = true
    }
    
    //MARK: Properties
    func setImage(_ selected:String, highlighted:String) {
        self.selectedImgeName = selected
        self.highlightedImgeName = highlighted
    }
    
    //MARK: Target and Selectors
    func addTarget(_ target:AnyObject, selector:Selector, object:AnyObject?) {
        self.target = target
        self.selector = selector
        self.object_param = object
    }
   
    //MARK: UIResponder
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard (self.exclusiveTouch) else {
            return
        }
        
        guard (self.selection == nil) else {
            return
        }
        
        self.selection = touches.first;
        self.RM_animateWithImage(self.highlightedImgeName, scale:TOUCH_DOWN_SCALE)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard self.exclusiveTouch else {
            return
        }
        
        guard selection != nil else {
            return
        }
        
        guard touches.contains(self.selection!) else {
            return
        }
        
        let touchPoint = self.selection!.location(in: self) as CGPoint
        let lenX = self.size.width / 2
        let lenY = self.size.height / 2
        
        guard((touchPoint.x > lenX + TOUCH_MARGIN)
             || (touchPoint.x < (-lenX - TOUCH_MARGIN))
             || (touchPoint.y > lenY + TOUCH_MARGIN)
             || (touchPoint.y < (-lenY - TOUCH_MARGIN))) else {
                return
        }
        
        self.touchesCancelled(touches, with: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard selection != nil else {
            return
        }
        
        guard touches.contains(self.selection!) else {
            return
        }
        
        self.selection = nil;
        self.RM_animateWithImage(self.selectedImgeName, scale:TOUCH_UP_SCALE)
        
        guard (self.selector != nil || self.target != nil) else {
            return
        }
        _ = self.target?.perform(selector!, with: object_param)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard selection != nil else {
            return
        }
        
        guard touches.contains(self.selection!) else {
            return
        }
        
        self.selection = nil;
        self.RM_animateWithImage(self.selectedImgeName, scale:TOUCH_UP_SCALE)
    }
    
    //MARK: Private Method
   final func RM_animateWithImage(_ imageNamed:String!, scale:CGFloat) {
    
    guard (imageNamed == nil) else {
        let texture = SKTexture(imageNamed: imageNamed)
        self.texture = texture
        return
      }
    self.run(SKAction.scale(by: scale, duration: 0.2))
   }
            
}

