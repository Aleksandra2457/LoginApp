//
//  User.swift
//  LoginApp
//
//  Created by Александра Лесовская on 16.03.2022.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "User",
            password: "Password",
            person: .getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let description: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Aleksandra", surname: "Moiseenko", description: "Hello!")
    }
}
