//
//  HelpViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/9/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var helpScreens: [String] = ["help-1","help-2","help-3"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        pageControl.numberOfPages = helpScreens.count
        setupScreens()
        
        scrollView.delegate = self
        
    }
    
    
    func setupScreens() {
        for index in 0..<helpScreens.count {
            // 1.
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            // 2.
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: helpScreens[index])
            
            self.scrollView.addSubview(imgView)
        }
        
        // 3.
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(helpScreens.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }

    

}
