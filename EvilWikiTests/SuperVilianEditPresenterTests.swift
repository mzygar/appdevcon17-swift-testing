//
//  SuperVilianEditPresenterTests.swift
//  EvilWiki
//
//  Created by Michal Zygar on 16/03/2017.
//  Copyright © 2017 Catawiki. All rights reserved.
//

import XCTest
@testable import EvilWiki

class SuperVilianEditPresenterTests: XCTestCase {

    // MARK: - Constants and params
    let fullName = "Doctor Evil"

    // MARK: - Setup and tear down
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

        super.tearDown()
    }

    // MARK: - Tests
    func testViewReadyInvokesGetSuperVilian () {
        //Arrange
        let repo = SuperVilianRepoDouble()
        let sut = SuperVilianEditPresenter(repo: repo)
        //Act
        sut.viewReady()

        //Assert
        XCTAssert(repo.getSuperVilianInvoked)

    }


    func testViewReadyUpdatesViewTitle () {
        //Arrange
        let repo = SuperVilianRepoStub()
        repo.result = SuperVilian(fullName: fullName)

        let sut = SuperVilianEditPresenter(repo: repo)

        let spy = SuperVilianEditViewSpy()
        sut.view = spy

        //Act
        sut.viewReady()

        //Assert
        XCTAssertEqual(fullName, spy.title)
    }


    func testViewReadyUpdatesViewTitleWithMock () {
        //Arrange
        let repo = SuperVilianRepoStub()
        repo.result = SuperVilian(fullName: fullName)

        let sut = SuperVilianEditPresenter(repo: repo)

        let mock = SuperVilianEditViewMock()
        mock.expectedTitle = fullName
        sut.view = mock

        //Act
        sut.viewReady()

        //Assert
        XCTAssert(mock.verify())
    }

    // MARK: - Test doubles
    class SuperVilianRepoDouble: SuperVilianRepository {
        var getSuperVilianInvoked = false

        func getSuperVilian(fullName: String) -> SuperVilian? {
            getSuperVilianInvoked = true
            return nil
        }
    }


    class SuperVilianRepoStub: SuperVilianRepository {
        var result:SuperVilian?

        func getSuperVilian(fullName: String) -> SuperVilian? {
            return result
        }
    }


    class SuperVilianEditViewSpy:SuperVilianEditView {

        var title:String?
        func display(title:String) {
            self.title = title
        }
    }

    class SuperVilianEditViewMock:SuperVilianEditView {

        var expectedTitle:String?
        private var title:String?
        func display(title:String) {
            self.title = title
        }

        func verify() -> Bool {
            return title == expectedTitle
        }
    }

}
