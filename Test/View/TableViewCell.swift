//
//  TableViewCell.swift
//  Test
//
//  Created by Rohit Prajapati on 16/06/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cellTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpIntials()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func setUpIntials(){
        
        collectionView.register(UINib(nibName: "RecommendedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecommendedCollectionViewCell")
        
        collectionView.register(UINib(nibName: "TopDeveloperCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopDeveloperCollectionViewCell")
        
        collectionView.register(UINib(nibName: "PreSalesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PreSalesCollectionViewCell")
        
        collectionView.register(UINib(nibName: "PopularProjectsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularProjectsCollectionViewCell")
        
        collectionView.register(UINib(nibName: "FeatureLocalitiesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeatureLocalitiesCollectionViewCell")
        
    }

}

extension TableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}
