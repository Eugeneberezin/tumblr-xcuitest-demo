//
//  RegistrationScreens.swift
//  Tumblr-XCUITest-demoUITests
//
//  Created by Eugene Berezin on 6/9/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import Foundation
import XCTest

class RegistrationScreens {
    
    static let tumblr = XCUIApplication(bundleIdentifier: "com.tumblr.tumblr")
    
    struct Buttons {
        let done: XCUIElement
        let account: XCUIElement
    }
    
    struct TextFields {
        let email: XCUIElement
        let password: XCUIElement
        let username: XCUIElement
        
    }
    
    struct Tabs {
        let posts: XCUIElement
    }
    
    
    static let buttons = Buttons(done: tumblr.navigationBars["Tumblr.AccountCompletionView"].buttons["Done"],
                                 account: tumblr.tabBars.buttons["Account"])
    
    static let textFields = TextFields(email: tumblr.textFields["email"],
                                       password: tumblr.secureTextFields["password"],
                                       username: tumblr.textFields["username"])
    static let tabs = Tabs(posts: tumblr.buttons["Posts"])
    
    static func generateUniqueEmail() -> String {
        let time = Date().timeIntervalSinceReferenceDate
        let email = "awesometester+\(time)@mailsack.com"
        return email
    }
    
    static func generateUniqueUserName() -> String {
        let time = Date().timeIntervalSinceReferenceDate
        let userName = "awesomeTester+\(time)"
        return userName
        
    }
    
    static func pickInterests() {
        let howOldAreYouTextField = tumblr.textFields["How old are you?"]
        tumblr.buttons["Get Started"].tap()
        howOldAreYouTextField.tap()
        howOldAreYouTextField.typeText("25")
        tumblr.navigationBars["TMOnboardingNavigationWrapperView"].buttons["Next"].tap()
        Thread.sleep(forTimeInterval: 5)
        tumblr.collectionViews.staticTexts["Curators"].tap()
        tumblr.collectionViews.staticTexts["GIF art"].tap()
        tumblr.collectionViews.staticTexts["Animation"].tap()
        tumblr.collectionViews.staticTexts["Motion Graphics"].tap()
        tumblr.collectionViews.staticTexts["Net Art"].tap()
        tumblr.navigationBars["Tap the things you like"].buttons["Next"].tap()
        
    }
    
    static func registerNewUser(userName: String, email: String, password: String) {
        buttons.account.tap()
        textFields.email.tap()
        textFields.email.typeText(email)
        textFields.password.tap()
        textFields.password.typeText(password)
        textFields.username.tap()
        textFields.username.typeText(userName)
        buttons.done.tap()
    }
    


    static  func logOut(email: String) {
        tumblr.navigationBars["Tumblr.BlogView"].buttons["account icons settings"].tap()
        tumblr.tables.staticTexts["General settings"].tap()
        tumblr.tables.staticTexts[email].tap()
        tumblr.sheets["Are you sure you want to log out?"].buttons["Log out"].tap()
    }
}
