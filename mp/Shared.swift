//
//  Constants.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 26.05.2021.
//

import Foundation
import UIKit

let isIpad = UIDevice.current.userInterfaceIdiom == .pad
let apiPath = "https://darom.me/api/"
let emptyPreview = "https://darom.me/900x350"

var statusBarHeight: CGFloat {
    var statusBarHeight: CGFloat = 0
    if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
    }
    return statusBarHeight
}

func customRequest(url: URL, method: Method, params: [String: String], timeout: TimeInterval = 60,
                   completion: @escaping (_ json: Data?, _ status: Int?, _ error: String?) -> ()) -> URLSessionDataTask {
    let request = NSMutableURLRequest(url: url)
    request.timeoutInterval = timeout
    request.httpMethod = method.rawValue
    let session = URLSession.shared

    request.encodeParameters(parameters: params)

    let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
        let resp = response as? HTTPURLResponse
        completion(data, resp?.statusCode, error?.localizedDescription)
    }
    task.resume()
    return task
}

public enum Method: String{
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

func percentEscapeString(_ string: String) -> String {
    var characterSet = CharacterSet.alphanumerics
    characterSet.insert(charactersIn: "-._* ")

    return string
            .addingPercentEncoding(withAllowedCharacters: characterSet)!
            .replacingOccurrences(of: " ", with: "+")
            .replacingOccurrences(of: " ", with: "+", options: [], range: nil)
}
