//
//  HelpViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController, UIScrollViewDelegate {
    
    // mapping UI with code
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var helpScreens: [String] = ["help-1","help-2","help-3","help-4"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        // scroll view and page control
        pageControl.numberOfPages = helpScreens.count
        setupScreens()       
        scrollView.delegate = self
        
    }
    
    func setupScreens() {
        for index in 0..<helpScreens.count {
            // 1. set frame size to scroll view
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            // 2. add images into scroll view
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: helpScreens[index])
            
            self.scrollView.addSubview(imgView)
        }
        
        // 3. set entire content size to scroll view
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(helpScreens.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    /**
     - Indicating end or scroll view with the number of pages from page control
     - parameters:
     -  scrollView: The UI scroll view
     */
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    
    
}
