//
//  CalculateViewController.swift
//  ios-financial-calculator
//
//  Created by Koshila Dissanayake on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    var calculateIcons = [CalculateIcons]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateCalculateIcons()
    }
    
    func generateCalculateIcons() {
        let interest = CalculateIcons(name: "Interest", icon: UIImage(named: "savings-icon")!, segueID: "goToInterestCalculation", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
        calculateIcons += [interest]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calculateIcons.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CalculateIconViewCell
    
        cell.calculateName.text = calculateIcons[indexPath.row].getCalculateIconName()
        cell.calculateIcon.image = calculateIcons[indexPath.row].getCalculateIcon()
        
        
        cell.contentView.backgroundColor = calculateIcons[indexPath.row].getCellColour()
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }

    // This function is called when an item in the collection view is selected.
    // performSegue() method will help navigate to the specified conversion page.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: calculateIcons[indexPath.row].getSegueID(), sender: self)
    }
    
}
