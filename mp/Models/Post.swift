//
//  Post.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 27.05.2021.
//

import Foundation
import UIKit

class Post: Codable {
    var id: Int
    var userId: Int
    var title: String
    var description: String?
    var preview: String?
    var images: [String] = [String]()
    var price: Int
    var vendorCode: String?
    var isUsed: Int?
    var delivery: Int

    var previewImages: [String] {
        return images.count == 0 ? [emptyPreview] : images
    }

    init(id: Int, userId: Int, title: String, description: String?, preview: String?, images: [String], price: Int, vendorCode: String?, isUsed: Int?, delivery: Int) {
        self.id = id
        self.userId = userId
        self.title = title
        self.description = description
        self.preview = preview
        self.images = images
        self.price = price
        self.vendorCode = vendorCode
        self.isUsed = isUsed
        self.delivery = delivery
    }

    convenience required init(from: Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)
        let id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        let userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
        let title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        let description = try container.decodeIfPresent(String.self, forKey: .description)
        let preview = try container.decodeIfPresent(String.self, forKey: .preview)
        let price = try container.decodeIfPresent(Int.self, forKey: .price) ?? 0
        let vendorCode = try container.decodeIfPresent(String.self, forKey: .vendorCode)
        let isUsed = try container.decodeIfPresent(Int.self, forKey: .isUsed)
        let delivery = try container.decodeIfPresent(Int.self, forKey: .delivery) ?? 0

        var images = [String]()
        if let imagesString = try container.decodeIfPresent(String.self, forKey: .images) {
            images = imagesString.components(separatedBy: ",")
        }

        self.init(id: id, userId: userId, title: title, description: description, preview: preview, images: images, price: price, vendorCode: vendorCode, isUsed: isUsed, delivery: delivery)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case description
        case title
        case preview
        case images
        case price
        case vendorCode
        case isUsed
        case delivery
    }

    class func getPosts(completion: @escaping ([Post]?) -> Void) {
        if let url = URL(string: apiPath + "items") {
            let _ = customRequest(url: url, method: .get, params: [:]) { (data, status, error) in
                if error != nil {
                    completion(nil)
                } else if let postData = data {
                    do {
                        let decoder = JSONDecoder()
                        let posts = try decoder.decode([Post].self, from: postData)
                        completion(posts)
                    } catch let err {
                        let str = String(data: data!, encoding: .utf8)
                        print(err, str ?? "")
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
        } else {
            completion(nil)
        }
    }
}
