//
//  PopularProjectsCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Rohit Prajapati on 15/06/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import UIKit
import SDWebImage

class PopularProjectsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var appartmentType: UILabel!
    @IBOutlet weak var typeName: UILabel!
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
    
    
    func setPopularProjects(data: PopularProjects) {
        var projectImage = String()
        if let image = data.image {
            projectImage = image
        }
        
        self.image.sd_setImage(with: URL(string: projectImage), placeholderImage: UIImage(named: "placeholder.png"))
        
        self.name.text = data.name
        self.typeName.text = data.address
        
        if let price = data.minPrice {
            self.price.text = "$" + price
        } else {
            self.price.text = "N/A"
        }
        
        
    }

}
