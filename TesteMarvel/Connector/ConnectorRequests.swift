//
//  ConnectorRequests.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 22/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

enum keys: String {
    case privateKey = "09ec01d269cff9ab4ac38fcc47dc4b2f094b8c5d"
    case publicKey = "be09b352b99d13cc867b5c490264a0e2"
}

enum baseURL: String {
    case url = "http://gateway.marvel.com/"
}

enum methods: String {
    case characters = "v1/public/characters?ts={timeStamp}&apikey={publicKey}&hash={HASH}"
}

class ConnectorRequests {
    static func request(method: String, completion: @escaping (Data) -> ()){
        
        let url = URL(string: self.formatURL(url: "\(baseURL.url.rawValue)\(method)"))
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
    static func downloadImage(urlString: String) -> UIImage{
        var image: UIImage?
        if let url = NSURL(string: urlString) {
            getData(from: url as URL) { data, response, error in
                guard let data = data, error == nil else { return }
                print(" IMAGE = \(data)")
                
                image = UIImage(data: data, scale: UIScreen.main.scale)
            }
        }
       
        return image ?? UIImage() 
    }
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    static func formatURL(url: String) -> String {
        
        let ts = Int64(NSDate.now.timeIntervalSinceReferenceDate)
        var urlString = url
        urlString = urlString.replacingOccurrences(of: "{timeStamp}", with: "\(ts)")
        urlString = urlString.replacingOccurrences(of: "{publicKey}", with: "\(keys.publicKey.rawValue)")
        let hash = "\(ts)" + keys.privateKey.rawValue + keys.publicKey.rawValue
        urlString = urlString.replacingOccurrences(of: "{HASH}", with: hash.md5Value)
        
        return urlString
    }
}
