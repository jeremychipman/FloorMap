//
//  FloorMapViewController.swift
//  FloorMap
//
//  Created by Jeremy Chipman on 11/6/15.
//  Copyright © 2015 Teus. All rights reserved.
//

import UIKit

class FloorMapViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
        
    @IBOutlet weak var scrollView: UIScrollView!
        
    @IBOutlet var masterView: UIView!
        
    @IBOutlet weak var frontView: UIView!
    
//    @IBOutlet weak var thirdFloorImageView: UIImageView!
    
    @IBOutlet weak var mainMapView: UIView!
    @IBOutlet weak var mapImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var edgeGesture: UIScreenEdgePanGestureRecognizer!
    var frontViewOriginalCenter: CGPoint!
    var initialTransform = CATransform3DIdentity
    
    
    // setting up for search
    
    var data: [String]!
    var filteredData: [String]!
    var searchController: UISearchController!
    
    // end search setup
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        pickMap(mapImageView, buildingName: "SB850C", floor: 1)
        scrollView.contentSize = CGSize(width: 1242, height: 400)
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 2.9
            
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        edgeGesture.edges = UIRectEdge.Left
        frontView.addGestureRecognizer(edgeGesture)
        
        
        //START SEARCH STUFF - github.com/codepath/ios_guides/wiki/Search-Bar-Guide
        data = ["Conference Room A", "Conference Room B", "Colbie Callait", "Training Room", "Cafeteria", "Observation Room"]
        tableView.delegate = self
        tableView.dataSource = self
        filteredData = data
        
        // Initializing with searchResultsController set to nil means that
        // searchController will use this view controller to display the search results
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        // If we are using this same view controller to present the results
        // dimming it out wouldn't make sense.  Should set probably only set
        // this to yes if using another controller to display the search results.
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        // Sets this view controller as presenting view controller for the search interface
        definesPresentationContext = true
        
        searchController.searchBar.sizeToFit()
        navigationItem.titleView = searchController.searchBar
        
        // By default the navigation bar hides when presenting the
        // search interface.  Obviously we don't want this to happen if
        // our search bar is inside the navigation bar.
        searchController.hidesNavigationBarDuringPresentation = false
        
        //END SEARCH STUFF
            
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func onEdgePan (edgeGesture: UIScreenEdgePanGestureRecognizer){
        
        var point = edgeGesture.locationInView(view)
        var translation = edgeGesture.translationInView(view)
        frontViewOriginalCenter = frontView.center
        if edgeGesture.state == UIGestureRecognizerState.Began {
                
                
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.frontView.center.x = self.frontViewOriginalCenter.x + 160
            })
                
            
                
            print("screen edge called \(frontView.frame.origin)")
        }
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.mainMapView
            
    }

    
    func skewMap(mapView: UIView) {
        
        initialTransform.m34 = 1.0 / 220
        initialTransform = CATransform3DRotate(initialTransform, CGFloat(-45 * CGFloat(M_PI) / 180), 1, 0, 0)
        mapView.layer.transform = initialTransform
        //        transform = initialTransform
        
    }
    
    
    // inject an image asset into a UiImageView. Pass this function the name of the image view, the name of the building, and the floor. Building name is a string and will need to be in quotes.
    //    Accepted Building names:
    //    SB850C = San Bruno, 850, Cherry
    //    SV860C = Sunnyvale, 860 California
    func pickMap(imageView: UIImageView, buildingName: NSString, floor: Int) {
        
        print(" \(buildingName) \(floor)")
        
        //assign image assets based on building, based on floor
        if buildingName == "SB850C" {
            if floor == 1 {
                imageView.image = UIImage(named: "SB850C1")
            } else if floor == 2 {
                imageView.image = UIImage(named: "SB850C2")
            } else if floor == 3 {
                imageView.image = UIImage(named: "SB850C3")
            } else if floor == 4 {
                imageView.image = UIImage(named: "SB850C4")
            } else if floor == 5 {
                imageView.image = UIImage(named: "SB850C5")
            } else if floor == 6 {
                imageView.image = UIImage(named: "SB850C6")
                
        } else if buildingName == "SV860C" {
            if floor == 1 {
                imageView.image = UIImage(named: "SV860C1")
            } //need to add conditions for other floors
                
            } //need to add conditions for other buildings
        }
       
        skewMap(imageView.superview!)
        
    }
    
    
    
    @IBAction func changeHeading(sender: UISlider) {
        // this function controls the map rotation based on a slider. eventually this will get replaced by rotating the map based on phone heading
        var headingVar = CGFloat(sender.value)
        var headingTransform = CATransform3DIdentity
        
        print("heading \(headingVar)")
        headingTransform.m34 = 1.0 / 220
        headingTransform = CATransform3DRotate(initialTransform, CGFloat((headingVar) * CGFloat(M_PI) / 180), 0, 0, 1)
        mainMapView.layer.transform = headingTransform
        
    }

    
    // START SEARCH FUNCTIONS
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResultsTableViewCell")! as! SearchResultsTableViewCell
        cell.roomNameLabel.text = filteredData[indexPath.row]
        cell.roomCapacityLabel.text = filteredData[indexPath.row]
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(" filtered data count is \(filteredData.count)")
        return filteredData.count
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        
        filteredData = searchText!.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            return dataString.rangeOfString(searchText!, options: .CaseInsensitiveSearch) != nil
        })
        
        tableView.reloadData()
    }
    //END SEARCH FUNCTIONS
    
}

