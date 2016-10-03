//
//  BleachURLS.swift
//  Bleach
//
//  Created by Jason Franklin on 03/10/2016.
//  Copyright © 2016 Jason Franklin. All rights reserved.
//

import Foundation

struct BleachURLS {
    fileprivate static let mappings = [
        "Bleach One": "https://dailyanimeart.files.wordpress.com/2011/10/final_getsuga_tenshou_by_mariuskyon-d2ytbog.jpg",
        "Bleach Two": "https://i.ytimg.com/vi/SU6KW6ePlL8/maxresdefault.jpg"
    ]

    static func mapURL(identifier: String = "Bleach One") -> URL? {
        if let url = mappings[identifier] {
            return URL(string: url)
        } else {
            return nil
        }
    }
}
