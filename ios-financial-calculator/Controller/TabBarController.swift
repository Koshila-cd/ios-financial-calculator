//
//  TabBarController.swift
//  ios-financial-calculator
//
//  Created by IIT on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is CalculateViewController {
            print("Calculations tab")
//        } else if viewController is SaveViewController {
//            print("Save tab")
//        } else if viewController is HistoryViewController {
//            print("History tab")
//        } else if viewController is ConstantsViewController {
//            print("Constants tab")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
