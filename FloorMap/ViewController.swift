//
//  ViewController.swift
//  FloorMap
//
//  Created by Teus on 10/27/15.
//  Copyright © 2015 Teus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate
{

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var masterView: UIView!
    
    @IBOutlet weak var thirdFloorImageView: UIImageView!
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1242, height: 400)
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 1.9
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.thirdFloorImageView
        
    }

}

