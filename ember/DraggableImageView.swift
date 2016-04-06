//
//  profileView.swift
//  ember
//
//  Created by Philippe Kimura-Thollander on 4/6/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit

class DraggableImageView: UIImageView {
    
    var initialCenter: CGPoint!
    var radians: CGFloat!
    
    func set(picture: UIImage) {
        self.image = picture

    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func onSwipe(sender: UIPanGestureRecognizer) {
        // Absolute (x,y) coordinates in parent view's coordinate system
        let point = sender.locationInView(self)
        
        // Total translation (x,y) over time in parent view's coordinate system
        let translation = sender.translationInView(self)
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = self.center
            radians = 0
            print("Gesture began at: \(point)")
        } else if sender.state == UIGestureRecognizerState.Changed {
            self.center = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y)
            if (self.center.x > initialCenter.x){
                radians = (translation.x / 1000)
                print("\(radians)")
                self.transform = CGAffineTransformMakeRotation(radians)
                self.center.y = initialCenter.y + translation.x / 4
            }
            if (self.center.x < initialCenter.x){
                radians = (translation.x / 1000)
                print("\(radians)")
                self.transform = CGAffineTransformMakeRotation(radians)
                self.center.y = initialCenter.y + -translation.x / 4
            }
            
            
            if(translation.x > 50) {
                UIView.animateWithDuration(0.5, animations: { 
                    self.center.x = UIScreen.mainScreen().bounds.size.width
                })
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            self.center = initialCenter
            self.transform = CGAffineTransformMakeRotation(0)
        }
    }

}
