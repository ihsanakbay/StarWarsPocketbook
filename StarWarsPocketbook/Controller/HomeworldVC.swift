//
//  HomeworldVC.swift
//  StarWarsPocketbook
//
//  Created by Ihsan Akbay on 2019-01-30.
//  Copyright © 2019 Ihsan Akbay. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var terrainLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    var person: Person!
    let api = HomeworldApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        api.getHomeworld(url: person.homeworld) { (homeworld) in
            self.spinner.stopAnimating()
            if let homeworld = homeworld {
                self.setupView(homeworld: homeworld)
            }
        }
        
    }
    
    func setupView(homeworld: Homeworld){
        nameLabel.text = homeworld.name
        climateLabel.text = homeworld.climate
        terrainLabel.text = homeworld.terrain
        populationLabel.text = homeworld.population
    }
    

}
