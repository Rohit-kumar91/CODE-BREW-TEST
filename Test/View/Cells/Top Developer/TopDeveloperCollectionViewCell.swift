//
//  TopDeveloperCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Rohit Prajapati on 15/06/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import UIKit
import SDWebImage

class TopDeveloperCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var developerImage: UIImageView!
    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var projectCount: UILabel!
    @IBOutlet weak var developerName: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDeveloperData(data: TopDeveloper) {
        
        var developerImage = String()
        if let image = data.developerImage {
            developerImage = image
        }
        
        self.developerImage.sd_setImage(with: URL(string: developerImage), placeholderImage: UIImage(named: "placeholder.png"))
        self.developerName.text = data.developerTitle
        self.projectCount.text = data.salePropertyCount
        self.price.text = data.developerAddress
    }

}
