//
//  FadeEnabledButton.swift
//  StarWarsPocketbook
//
//  Created by Ihsan Akbay on 2019-01-31.
//  Copyright © 2019 Ihsan Akbay. All rights reserved.
//

import UIKit

class FadeEnabledButton: UIButton {

    // Check for Homeworld Url.
    override var isEnabled: Bool {
        didSet{
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }

}
