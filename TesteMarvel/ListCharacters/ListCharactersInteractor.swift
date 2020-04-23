//
//  ListCharactersInteractor.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 22/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

protocol ListCharactersInteractorHelper {
    func doRequestCharacters()
    func downloadImage(urlString: String) -> UIImage
    var characters: [Characters]? {get set}
}
class ListCharactersInteractor: ListCharactersInteractorHelper {
    var presenter: ListCharactersPresenterHelper!
    var characters: [Characters]?
      func doRequestCharacters() {
            ConnectorRequests.request(method: methods.characters.rawValue, completion: { objResponse in
                OperationQueue.main.addOperation {
                   let decoder = JSONDecoder()
                   do {
                        let response = try decoder.decode(ResponseDefault.self, from: objResponse)
                       
                    if let results = response.data?.results! {
                        self.characters = results
                        self.presenter.reloadData()
                    } else {
                        self.presenter.presentAlertFailedRequest()
                    }
                    
                   } catch {
                       print(error.localizedDescription)
                   }
                }
            })
        }
    func downloadImage(urlString: String) -> UIImage{
        return ConnectorRequests.downloadImage(urlString: urlString)
    }
}
