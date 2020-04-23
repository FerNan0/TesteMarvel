//
//  CharactersListCell.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 22/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

class CharactersListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView! {
        didSet {
            imageView?.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var lblName: UILabel! {
       didSet {
           
       }
    }

    func configure(imageURL: String, name: String) {
        lblName.text = "\(name)"
        imgView.image = ConnectorRequests.downloadImage(urlString: imageURL)
        
    }
    
}

