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
    }
    
    func setFeatureLocalities(data: FeaturedLocalities) {
        self.sartfeetLabel.text = data.perSquareFit ?? "" + "sq/ft"
        self.totalProjects.text = data.totalBuildingCount
    }

}
