//
//  SuperVilianTests.swift
//  EvilWiki
//
//  Created by Michal Zygar on 16/03/2017.
//  Copyright © 2017 Catawiki. All rights reserved.
//

import XCTest
@testable import EvilWiki
class SuperVilianTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDescriptionIsTitleSpaceName() {
        //Arrange
        let sut = SuperVilian(title: "Doctor", name: "Evil")
        //Act
        let description = sut.description
        //Assert
        XCTAssertEqual(TestData.fullName, description)
    }

    func testFullnameInitializerSetsTitleName() {
        //Arrange
        let sut = SuperVilian(fullName: TestData.fullName)
        //Act

        //Assert
        XCTAssertEqual("Doctor", sut?.title)
        XCTAssertEqual("Evil", sut?.name)
    }

    func testFullnameInitializerFailsForEmptyString() {
        //Arrange
        let sut = SuperVilian(fullName: "")
        //Act

        //Assert
        XCTAssertNil(sut)
    }
}
