//
//  CharactersCell.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 22/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

class CharactersCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView! {
        didSet {
        }
    }
    @IBOutlet weak var lblName: UILabel! {
       didSet {
           
       }
    }
    @IBOutlet weak var lblYear: UILabel! {
       didSet {
           
       }
    }
    
    func configure(imageURL: String, name: String, year: String) {
        lblName.text = "Name: \(name)"
        
    }
}

