//
//  Models.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 23/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

enum CodingDefaultKeys: String, CodingKey {
    case data
    case attributionHTML
    case attributionText
    case copyright
    case code
}

enum CodingDataResponseKeys: String, CodingKey {
    case count
    case limit
    case offset
    case results
    
}

enum CodingCharactersKeys: String, CodingKey {
    case name
    case resourceURI
    case description
    case thumbnail
    
}

enum CodingThumbnailKeys: String, CodingKey {
    case path
    case `extension`
}

struct ResponseDefault: Codable {
    var data: DataResponse?
    var attributionHTML: String?
    var attributionText: String?
    var copyright: String?
    var code:  Int64?
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingDefaultKeys.self)
        data = try values.decode(DataResponse.self, forKey: .data)
        attributionHTML = try values.decode(String.self, forKey: .attributionHTML)
        attributionText = try values.decode(String.self, forKey: .attributionText)
        copyright = try values.decode(String.self, forKey: .copyright)
        code = try values.decode(Int64.self, forKey: .code)
    }
}

struct DataResponse: Codable {
    var count: Int64?
    var limit: Int64?
    var offset: Int64?
    var results: [Characters]?
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingDataResponseKeys.self)
        count = try values.decode(Int64.self, forKey: .count)
        limit = try values.decode(Int64.self, forKey: .limit)
        offset = try values.decode(Int64.self, forKey: .offset)
        results = try values.decode([Characters].self, forKey: .results)
    }
}

struct Characters: Codable {
    var name: String?
    var resourceURI: String?
    var description: String?
    var thumbnail: Thumbnail?
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingCharactersKeys.self)
        name = try values.decode(String.self, forKey: .name)
        resourceURI = try values.decode(String.self, forKey: .resourceURI)
        description = try values.decode(String.self, forKey: .description)
        thumbnail = try values.decode(Thumbnail.self, forKey: .thumbnail)
    }
}

struct Thumbnail: Codable {
    var path: String?
    var `extension`: String?
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingThumbnailKeys.self)
        path = try values.decode(String.self, forKey: .path)
        self.extension = try values.decode(String.self, forKey: .`extension`)
    }
}
