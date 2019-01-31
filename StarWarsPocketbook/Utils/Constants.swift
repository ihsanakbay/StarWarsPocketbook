//
//  Constants.swift
//  StarWarsPocketbook
//
//  Created by Ihsan Akbay on 2019-01-30.
//  Copyright © 2019 Ihsan Akbay. All rights reserved.
//

import Foundation

let BASE_URL = "https://swapi.co/api/"

let PERSON_URL = BASE_URL + "people/"

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void

