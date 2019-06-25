//
//  InitialTableViewController.swift
//  Test
//
//  Created by Rohit Prajapati on 16/06/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import UIKit
import SwiftyJSON

class InitialTableViewController: UITableViewController {
    
    
    var apartTitle = [String]()
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServiceHelper.sharedInstance.createPostRequest(isShowHud: true, params: [:], apiName: HOME) { (response, error) in
            
            if error != nil {
                AlertController.alert(title: API_FAIL, message: (error?.description)!)
                return
            }
            
            
            if (response != nil) {
                let jsonResponse = JSON(response as Any)
                if jsonResponse["success"].boolValue {
                    //Success
                    self.data = Data(response: jsonResponse["data"])
                    self.apartTitle = ["Recommended","Top Developers", "Pre-Sales", "Popular Projests", "Featured Localities"]
                    self.tableView.reloadData()
                    
                } else {
                    AlertController.alert(title: API_FAIL, message: jsonResponse["error"].stringValue)
                }
            }
            
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apartTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.collectionView.tag = indexPath.row
        cell.cellTitle.text = apartTitle[indexPath.row]
        return cell
    }
    
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 350
        } else if indexPath.row == 3 {
            return 220
        } else if indexPath.row == 4 {
            return 140
        }
        else {
            return 260
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        
    }


}


extension InitialTableViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 0 {
            if let count = data?.recommended?.count {
                return count
            } else {
                return 0
            }
        }
        
        else if collectionView.tag == 1 {
            if let count = data?.topDeveloper?.count {
                return count
            } else {
                return 0
            }
        }
        
        else if collectionView.tag == 2 {
            if let count = data?.preSale?.count {
                return count
            } else {
                return 0
            }
        }
        
        else if collectionView.tag == 3 {
            if let count = data?.popularProjects?.count {
                return count
            } else {
                return 0
            }
        }
        
        else if collectionView.tag == 4 {
            if let count = data?.featuresLocalities?.count {
                return count
            } else {
                return 0
            }
        }
        
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollectionViewCell", for: indexPath) as! RecommendedCollectionViewCell
            
            cell.backgroundColor = .white
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.layer.shadowOffset = CGSize(width: 0, height: 1)
            cell.layer.shadowRadius = 4.0
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            

            if let recommended = data?.recommended?[indexPath.item] {
                cell.setRecommendedValues(data: recommended)
            }
     
            
            return cell
        }
            
        else if collectionView.tag == 1  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopDeveloperCollectionViewCell", for: indexPath) as! TopDeveloperCollectionViewCell
            
            cell.backgroundColor = .white
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.layer.shadowOffset = CGSize(width: 0, height: 1)
            cell.layer.shadowRadius = 4.0
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            
            if let topDeveloper = data?.topDeveloper?[indexPath.item] {
                cell.setDeveloperData(data: topDeveloper)
            }
            
            return cell
        }
            
        else if collectionView.tag == 2  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreSalesCollectionViewCell", for: indexPath) as! PreSalesCollectionViewCell
            
            cell.backgroundColor = .white
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.layer.shadowOffset = CGSize(width: 0, height: 1)
            cell.layer.shadowRadius = 4.0
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            
            if let preSales = data?.preSale?[indexPath.item] {
                cell.setPreSales(data: preSales)
            }
            
            return cell
        }
            
        else if collectionView.tag == 3  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularProjectsCollectionViewCell", for: indexPath) as! PopularProjectsCollectionViewCell
            
            cell.backgroundColor = .white
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.layer.shadowOffset = CGSize(width: 0, height: 1)
            cell.layer.shadowRadius = 4.0
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            
            if let popularProjects = data?.popularProjects?[indexPath.item] {
                cell.setPopularProjects(data: popularProjects)
            }
            
            return cell
        }
            
        else if collectionView.tag == 4  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureLocalitiesCollectionViewCell", for: indexPath) as! FeatureLocalitiesCollectionViewCell
            
            
            cell.backgroundColor = .white
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.layer.shadowOffset = CGSize(width: 0, height: 1)
            cell.layer.shadowRadius = 4.0
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            
            if let featureLocalities = data?.featuresLocalities?[indexPath.item] {
                cell.setFeatureLocalities(data: featureLocalities)
            }
            
            return cell
        }
            
        else {
            return UICollectionViewCell()
        }
        
        //return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView.tag == 0 {
            return CGSize(width: 215.0, height: 278.0)
        } else if collectionView.tag == 1 {
            return CGSize(width: 155.0, height: 181.0)
        } else if collectionView.tag == 2 {
            return CGSize(width: 330.0, height: 181.0)
        } else if collectionView.tag == 3 {
            return CGSize(width: 330.0, height: 118)
        } else if collectionView.tag == 4 {
            return CGSize(width: 330.0, height: 70)
        }
        else {
            return CGSize()
        }
    }
}

