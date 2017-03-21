//
//  SuperVilian.swift
//  EvilWiki
//
//  Created by Michal Zygar on 16/03/2017.
//  Copyright © 2017 Catawiki. All rights reserved.
//

import Foundation
struct SuperVilian:CustomStringConvertible {
    let title: String
    let name: String

    var description: String  {
        return title + " " + name
    }
}


extension SuperVilian {
    init?(fullName:String) {
        guard !fullName.isEmpty else {
            return nil
        }

        let nameComponents = fullName.components(separatedBy: " ")

        title = nameComponents[0]
        name = nameComponents[1]
    }
}
