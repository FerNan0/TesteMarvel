//
//  ListCharactersPresenter.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 23/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import Foundation

protocol ListCharactersPresenterHelper {
    func presentAlertFailedRequest()
    func reloadData()
}
class ListCharactersPresenter: NSObject {
    var viewController: ListCharactersViewControllerHelper!
}

extension ListCharactersPresenter: ListCharactersPresenterHelper {
    func reloadData() {
        viewController.reloadTBVData()
    }
    
    func presentAlertFailedRequest() {
        viewController.showAlertFailedRequest()
    }   
}
