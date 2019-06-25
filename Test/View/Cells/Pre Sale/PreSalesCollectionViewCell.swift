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
    
    func setPreSales(data: PreSales) {
        var preSaleImage = String()
        if let image = data.image {
            preSaleImage = image
        }
        
        self.image.sd_setImage(with: URL(string: preSaleImage), placeholderImage: UIImage(named: "placeholder.png"))
        
        self.title.text = data.name
    }

}
