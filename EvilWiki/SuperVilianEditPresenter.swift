//
//  SuperVilianEditPresenter.swift
//  EvilWiki
//
//  Created by Michal Zygar on 16/03/2017.
//  Copyright © 2017 Catawiki. All rights reserved.
//

import Foundation

class SuperVilianEditPresenter {
    let repo: SuperVilianRepository

    var view: SuperVilianEditView!
    var superVilian:SuperVilian? {
        didSet{
            updateView()
        }
    }

    init(repo:SuperVilianRepository) {
        self.repo = repo
    }

    func viewReady() {
        superVilian = repo.getSuperVilian(fullName: "Doctor Evil")
    }

    func updateView() {
        view?.display(title: superVilian?.description ?? "")
    }
}
