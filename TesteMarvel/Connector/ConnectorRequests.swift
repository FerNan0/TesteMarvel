//
//  ConnectorRequests.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 22/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

enum baseURL: String {
    case url = "http://gateway.marvel.com/v1/public/characters?ts=1586975050&apikey=be09b352b99d13cc867b5c490264a0e2&hash=544a452c7d54c4db04424e8a16ee68f6"
}

class ConnectorRequests {
    static func request(method: String, completion: @escaping (Data) -> ()){
        let url = URL(string: "\(baseURL.url.rawValue)")
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
          if error != nil {
            print(error)
          } else {
            do {
              let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                
                completion(data!)
                print(parsedData)
              
            } catch let error as NSError {
              print(error)
            }
          }

        }.resume()
    }
    
    static func downloadImage(from url: URL, completion: @escaping (UIImage) -> ()) {
        var img: UIImage?
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            img = UIImage(data: data)
            completion(img!)
        }
    }
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
