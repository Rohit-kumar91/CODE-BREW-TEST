//
//  ServiceModel.swift
//  Test
//
//  Created by Rohit Prajapati on 16/06/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import Foundation
import SwiftyJSON

class Data {
    var recommended: [Recommended]?
    var topDeveloper: [TopDeveloper]?
    var preSale: [PreSales]?
    var popularProjects : [PopularProjects]?
    var featuresLocalities: [FeaturedLocalities]?
    
    init(response: JSON) {
        
        //For Recomended...
        var recommendedItems:[Recommended] = []
        
        for data in response["recommended"].arrayValue {
            let recommended = Recommended(address: data["locality"]["name"].stringValue,
                                    name: data["name"].stringValue,
                                    image: data["image"].stringValue)
            recommendedItems.append(recommended)
        }
        self.recommended = recommendedItems
        
        //For Top Developer....
        var topDeveloperItems:[TopDeveloper] = []
        for data in response["top_developers"].arrayValue {
            let topDeveloper = TopDeveloper(developerImage: data["image"].stringValue,                                              developerCompany: data["developer_company"].stringValue,
                                                salePropertyCount: data["sale_property_count"].stringValue,
                                                developerAddress: data["developer_address"].stringValue,
                                                developerTitle: data["developer_title"].stringValue)
            topDeveloperItems.append(topDeveloper)
        }
        self.topDeveloper = topDeveloperItems
        
        //For pre Sales....
        var preSales:[PreSales] = []
        for data in response["pre_sale"].arrayValue {
            let topDeveloper = PreSales(name: data["name"].stringValue,
                                        minPrice: data["min_price"].stringValue,
                                        image: data["main_image"].stringValue)
            preSales.append(topDeveloper)
        }
        self.preSale = preSales
        
        //For Popular Projects
        var popularProjects:[PopularProjects] = []
        for data in response["popular_projects"].arrayValue {
            let projects = PopularProjects(name: data["name"].stringValue,
                                           address: data["address"].stringValue,
                                           minPrice: data["min_price"].stringValue,
                                           image: data["main_image"].stringValue)
            popularProjects.append(projects)
        }
        self.popularProjects = popularProjects
        
        
        //For Featured Localities
        var featureLocalities:[FeaturedLocalities] = []
        for data in response["featured_localities"].arrayValue {
            let localities = FeaturedLocalities(perSquareFit: data["price_per_sqft"].stringValue,
                                                totalBuildingCount: data["buildings_count"].stringValue)
            featureLocalities.append(localities)
        }
        self.featuresLocalities = featureLocalities
        
    }
}

class Recommended {
    var address: String?
    var name: String?
    var image: String?

    init(address: String, name: String, image: String) {
        self.address = address
        self.name = name
        self.image = image
    }
}


class TopDeveloper {
    var developerImage: String?
    var developerCompany: String?
    var salePropertyCount: String?
    var developerAddress: String?
    var developerTitle: String?
    
    
    init(developerImage: String, developerCompany: String, salePropertyCount: String, developerAddress: String, developerTitle: String) {
        self.developerImage = developerImage
        self.developerCompany = developerCompany
        self.salePropertyCount = salePropertyCount
        self.developerAddress = developerAddress
        self.developerTitle = developerTitle
    }
}


class PreSales {
    var name: String?
    var minPrice: String?
    var image: String?
    
    init(name: String, minPrice: String, image: String) {
        self.name = name
        self.minPrice = minPrice
        self.image = image
    }
}

class PopularProjects {
    var name: String?
    var address: String?
    var minPrice: String?
    var image: String?
    
    init(name: String, address: String, minPrice: String, image: String) {
        self.name = name
        self.minPrice = minPrice
        self.image = image
        self.address = address
    }
}

class FeaturedLocalities {
    var perSquareFit: String?
    var totalBuildingCount: String?
    
    init(perSquareFit: String, totalBuildingCount: String) {
        self.perSquareFit = perSquareFit
        self.totalBuildingCount = totalBuildingCount
    }
}

