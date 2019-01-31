//
//  ViewController.swift
//  StarWarsPocketbook
//
//  Created by Ihsan Akbay on 2019-01-30.
//  Copyright © 2019 Ihsan Akbay. All rights reserved.
//

import UIKit

class PersonVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var homeworldButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var person: Person!
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func homewotldClicked(_ sender: Any) {
    }
    
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        spinner.startAnimating()
        personApi.getRandomPerson(id: random) { (person) in
            self.spinner.stopAnimating()
            if let person = person {
                self.setupView(person: person)
                self.person = person
            }
        }
    }
    
    func setupView(person: Person){
        nameLabel.text = person.name.lowercased()
        heightLabel.text = person.height.lowercased()
        massLabel.text = person.mass.lowercased()
        hairLabel.text = person.hair_color.lowercased()
        birthLabel.text = person.birth_year.lowercased()
        genderLabel.text = person.gender.lowercased()
        
        homeworldButton.isEnabled = !person.homeworld.isEmpty
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
    }
}

protocol PersonProtocol {
    var person: Person! {get set}
}
