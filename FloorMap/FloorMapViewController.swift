//
//  FloorMapViewController.swift
//  FloorMap
//
//  Created by Jeremy Chipman on 11/6/15.
//  Copyright © 2015 Teus. All rights reserved.
//

import UIKit

class FloorMapViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var masterView: UIView!
    
    @IBOutlet weak var frontView: UIView!
    
    @IBOutlet weak var thirdFloorImageView: UIImageView!
    
    var edgeGesture: UIScreenEdgePanGestureRecognizer!
    var frontViewOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1242, height: 400)
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 1.9
        
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        edgeGesture.edges = UIRectEdge.Left
        frontView.addGestureRecognizer(edgeGesture)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onEdgePan (edgeGesture: UIScreenEdgePanGestureRecognizer){
        
        var point = edgeGesture.locationInView(view)
        var translation = edgeGesture.translationInView(view)
        
        if edgeGesture.state == UIGestureRecognizerState.Began {
            frontViewOriginalCenter = frontView.center
            print("Gesture began at: \(point)")
            
        }
        else if edgeGesture.state == UIGestureRecognizerState.Changed {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.frontView.center.x = CGFloat(self.frontViewOriginalCenter.x + translation.x)
                }, completion: nil)
        }
            
        else if edgeGesture.state == UIGestureRecognizerState.Ended {
            print("screen edge called \(frontView.frame.origin)")
            if translation.x < 250 {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.frontView.center.x = CGFloat(self.frontViewOriginalCenter.x)
                    }, completion: nil)
            }
            else if translation.x >= 250 {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.frontView.center.x = CGFloat(self.frontViewOriginalCenter.x + 250)
                    }, completion: nil)
                
            }
        }
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.thirdFloorImageView
        
    }
    
    
}

