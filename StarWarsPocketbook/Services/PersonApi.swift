//
//  PersonApi.swift
//  StarWarsPocketbook
//
//  Created by Ihsan Akbay on 2019-01-30.
//  Copyright © 2019 Ihsan Akbay. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonApi {
    
    // Web Request with Alamofire
    func getRandomPerson(id:Int, completion: @escaping PersonResponseCompletion) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else {return}
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else {return completion(nil)}
            let jsonDecoder = JSONDecoder()
            
            do{
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    // With SwiftyJSON
    private func parsePerson(json: JSON) -> Person {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair_color = json["hair_color"].stringValue
        let birth_year = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworld = json["homeworld"].stringValue
        
        return Person(name: name, height: height, mass: mass, hair_color: hair_color, birth_year: birth_year, gender: gender, homeworld: homeworld)
    }
    
    
}
