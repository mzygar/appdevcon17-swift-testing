//
//  SuperVilianEditViewControllerTests.swift
//  EvilWiki
//
//  Created by Michal Zygar on 16/03/2017.
//  Copyright © 2017 Catawiki. All rights reserved.
//

import XCTest
@testable import EvilWiki
class SuperVilianEditViewControllerTests: XCTestCase {
    var sut:SuperVilianEditViewController!

    let storyboardName = "Main"

    var presenter: SuperVilianEditPresenterDouble!

    override func setUp() {
        super.setUp()
        presenter = SuperVilianEditPresenterDouble(repo: SuperVilianRepoDummy())
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: SuperVilianEditViewController.ID) as! SuperVilianEditViewController
        sut.presenter = presenter
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        presenter = nil
        super.tearDown()
    }
    
    func testViewDidLoadInvokesViewDidReadyPresenter () {
        //Arrange



        //Act
        _ = sut.view //invokes viewDIdLoad()

        //Assert
        XCTAssert(presenter.viewReadyInvoked)
    }


    class SuperVilianEditPresenterDouble: SuperVilianEditPresenter {
        var viewReadyInvoked = false
        override func viewReady() {
            viewReadyInvoked = true
        }
    }



    class SuperVilianRepoDummy: SuperVilianRepository {
        func getSuperVilian(fullName: String) -> SuperVilian? {
            return nil
        }
    }

}
