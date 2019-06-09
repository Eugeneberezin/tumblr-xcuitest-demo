//
//  Tumblr_XCUITest_demoUITests.swift
//  Tumblr-XCUITest-demoUITests
//
//  Created by Eugene Berezin on 6/8/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import XCTest

class Tumblr_XCUITest_demoUITests: XCTestCase {
    
    let tumblr = XCUIApplication(bundleIdentifier: "com.tumblr.tumblr")

    override func setUp() {
        
        continueAfterFailure = false
        tumblr.launch()
    }

    override func tearDown() {
       tumblr.terminate()
    }
    

    func testTubmlrNewUserRegistrationTest() {
        let email = RegistrationScreens.generateUniqueEmail()
        
        if tumblr.buttons["Get Started"].exists {
            RegistrationScreens.pickInterests()
       
        }
        guard RegistrationScreens.buttons.account.waitForExistence(timeout: 30) else {
            XCTFail("Test did not move further from the interesis")
            return
        }
        
        RegistrationScreens.registerNewUser(userName: RegistrationScreens.generateUniqueUserName(), email: email, password: "AwesomePassword123$")
        
        guard RegistrationScreens.buttons.account.waitForExistence(timeout: 30) else {
            XCTFail("Account is not visible")
            return
        }
        
        RegistrationScreens.buttons.account.tap()
        guard RegistrationScreens.tabs.posts.waitForExistence(timeout: 30) else {
            XCTFail("Posts is not visiblle")
            return
        }
        XCTAssert(RegistrationScreens.tabs.posts.exists, "Posts tab is not visible")
        Thread.sleep(forTimeInterval: 5)
        RegistrationScreens.logOut(email: email)
        
    }

}
