//
//  RecommendedCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Rohit Prajapati on 15/06/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import UIKit
import SDWebImage

class RecommendedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var apartmenetType: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgView.layer.cornerRadius = 13
        self.bgView.layer.masksToBounds = true
        
    }
    
    func setRecommendedValues(data: Recommended){
        
        var apartImage = String()
        if let image = data.image {
            apartImage = image
        }
        
        self.imageView.sd_setImage(with: URL(string: apartImage), placeholderImage: UIImage(named: "placeholder.png"))
        self.title.text = data.name
        
        if let address = data.address {
             self.addressLabel.text = "📍" + address
        } else {
             self.addressLabel.text = "📍" + "N/A"
        }
        
    }
    

}
