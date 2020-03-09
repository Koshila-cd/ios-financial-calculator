//
//  CalculateViewController.swift
//  ios-financial-calculator
//
//  Created by IIT on 3/8/20.
//  Copyright © 2020 IIT. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    var calculateIcons = [CalculateIcons]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateCalculateIcons()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func generateCalculateIcons() {
        let interest = CalculateIcons(name: "Interest", icon: UIImage(named: "savings-icon")!, segueID: "goToInterestCalculation", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
//        let savings = CalculateIcons(name: "Tempertaure", icon: UIImage(named: "ic_temperature")!, segueID: "goToTemperatureConversion", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
//        let loans = CalculateIcons(name: "Volume", icon: UIImage(named: "ic_volume")!, segueID: "goToVolumeConversion", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
//        let mortgage = CalculateIcons(name: "Distance", icon: UIImage(named: "ic_distance")!, segueID: "goToDistanceConversion", cellColour: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00))
        
//        calculateIcons += [interest, savings, loans, mortgage]
        calculateIcons += [interest]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calculateIcons.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CalculateIconViewCell
    
        cell.calculateName.text = calculateIcons[indexPath.row].getCalculateIconName()
        cell.calculateIcon.image = calculateIcons[indexPath.row].getCalculateIcon()
        
        
        //Card(cell) styles
        cell.contentView.backgroundColor = calculateIcons[indexPath.row].getCellColour()
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = true
        
//        cell.c.layoutIfNeeded()
//        cell.imageCell.layer.masksToBounds = true
//        cell.imageCell.layer.cornerRadius = cell.imageCell.frame.height / 2
        
        return cell
    }

    // This function is called when an item in the collection view is selected.
    // performSegue() method will help navigate to the specified conversion page.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: calculateIcons[indexPath.row].getSegueID(), sender: self)
    }
    
}
