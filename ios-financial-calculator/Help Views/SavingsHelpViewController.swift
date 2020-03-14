//
//  SavingsHelpViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/13/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class SavingsHelpViewController: UIViewController, UIScrollViewDelegate {


    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var screenshots: [String] = ["app-logo","app-logo","app-logo"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.applyGradient(colours: [.black, .purple, .darkGray], locations: [0.0, 0.5, 1.0])
        
        pageControl.numberOfPages = screenshots.count
        setupScreens()
        
        scrollView.delegate = self
        
    }
    
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func setupScreens() {
        for index in 0..<screenshots.count {
            // 1.
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            // 2.
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: screenshots[index])
            
            self.scrollView.addSubview(imgView)
        }
        
        // 3.
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(screenshots.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }

}
