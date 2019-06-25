//
//  PreSalesCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Rohit Prajapati on 15/06/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import UIKit
import SDWebImage

class PreSalesCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var bhkLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var startFromLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        startFromLabel.layer.masksToBounds = true
        startFromLabel.layer.cornerRadius = 9
    }
    
    func setPreSales(data: PreSales) {
        var preSaleImage = String()
        if let image = data.image {
            preSaleImage = image
        }
        
        self.image.sd_setImage(with: URL(string: preSaleImage), placeholderImage: UIImage(named: "placeholder.png"))
        
        self.title.text = data.name
    }

}
