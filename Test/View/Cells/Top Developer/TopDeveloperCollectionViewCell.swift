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
