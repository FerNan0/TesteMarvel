//
//  DetailsCharacterInteractor.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 23/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

protocol DetailsCharacterInteractorHelper {
    func downloadImage(urlString: String) -> UIImage
}
class DetailsCharacterInteractor: DetailsCharacterInteractorHelper {
    func downloadImage(urlString: String) -> UIImage {
        return ConnectorRequests.downloadImage(urlString: urlString)
    }    
}
