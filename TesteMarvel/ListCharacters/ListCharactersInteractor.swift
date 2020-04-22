//
//  ListCharactersInteractor.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 22/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

class ListCharactersInteractor {

    func doRequest() {
        ConnectorRequests.request(method: "", completion: { objDetail in
            OperationQueue.main.addOperation {
               let decoder = JSONDecoder()
//               do {
//                   let detail = try decoder.decode(ResponsePostDetail.self, from: objDetail)
//                   print(detail)
//                   self.dados = detail
//               } catch {
//                   print(error.localizedDescription)
//               }
//               self.reload()
            }
        })
    }
}
