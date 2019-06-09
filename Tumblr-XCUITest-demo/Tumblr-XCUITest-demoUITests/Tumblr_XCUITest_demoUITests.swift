//
//  Tumblr_XCUITest_demoUITests.swift
//  Tumblr-XCUITest-demoUITests
//
//  Created by Eugene Berezin on 6/8/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import XCTest

class Tumblr_XCUITest_demoUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
       

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let tubblr = XCUIApplication(bundleIdentifier: "com.tumblr.tumblr")
        let emailTextField = tubblr.textFields["email"]
        let passwordTextField = tubblr.secureTextFields["password"]
        let usernameTextField = tubblr.textFields["username"]
        let doneButton = tubblr.navigationBars["Tumblr.AccountCompletionView"].buttons["Done"]
        let accountBar = tubblr.tabBars.buttons["Account"]
        tubblr.launch()
        //Thread.sleep(forTimeInterval: 10)
        accountBar.tap()
        
        emailTextField.tap()
        emailTextField.typeText("email@email.com")
        tubblr.secureTextFields["password"].tap()
        tubblr.textFields["username"].tap()
        tubblr.navigationBars["Tumblr.AccountCompletionView"].buttons["Done"].tap()
        
        
        
        
       
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
