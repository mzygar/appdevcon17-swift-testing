//
//  SuperVilianEditViewController.swift
//  EvilWiki
//
//  Created by Michal Zygar on 16/03/2017.
//  Copyright © 2017 Catawiki. All rights reserved.
//

import UIKit

class SuperVilianEditViewController: UIViewController {

    var presenter:SuperVilianEditPresenter?

    static let ID = "SuperVilianEditViewControllerID"

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewReady()
    }

}

extension SuperVilianEditViewController:SuperVilianEditView {
    func display(title: String) {
        self.title = title
    }
}
