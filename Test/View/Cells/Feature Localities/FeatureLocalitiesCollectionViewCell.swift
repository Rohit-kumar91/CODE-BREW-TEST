//
//  FeatureLocalitiesCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Rohit Prajapati on 15/06/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import UIKit

class FeatureLocalitiesCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var sartfeetLabel: UILabel!
    @IBOutlet weak var totalProjects: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        intialSetUp()
    }
    
    func intialSetUp() {
        self.backgroundColor = .white
        self.contentView.layer.cornerRadius = 4.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    func setFeatureLocalities(data: FeaturedLocalities) {
        self.sartfeetLabel.text = data.perSquareFit ?? "" + "sq/ft"
        self.totalProjects.text = data.totalBuildingCount
    }

}
