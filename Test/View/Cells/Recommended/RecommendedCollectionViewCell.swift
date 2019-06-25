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
        intialSetUp()
        
    }
    
    func intialSetUp() {
        self.bgView.layer.cornerRadius = 13
        self.bgView.layer.masksToBounds = true
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
