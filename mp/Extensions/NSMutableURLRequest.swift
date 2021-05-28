//
//  NSMutableURLRequest.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 27.05.2021.
//

import UIKit

extension NSMutableURLRequest {
    func encodeParameters(parameters: [String : String]) {
        let parameterArray = parameters.map { (arg) -> String in
            let (key, value) = arg
            return "\(key)=\(percentEscapeString(value))"
        }

        httpBody = parameterArray.joined(separator: "&").data(using: String.Encoding.utf8)
    }
}
