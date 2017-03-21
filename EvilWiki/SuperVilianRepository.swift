//
//  SuperVilianRepository.swift
//  EvilWiki
//
//  Created by Michal Zygar on 16/03/2017.
//  Copyright © 2017 Catawiki. All rights reserved.
//

import Foundation


protocol SuperVilianRepository {
    func getSuperVilian(fullName:String) -> SuperVilian?
}
