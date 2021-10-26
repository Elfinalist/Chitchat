//
//  DatabaseManager.swift
//  Chitchat
//
//  Created by ELVIS WANJOHI on 23/10/2021.
//

import Foundation
import Firebase

final class DatabaseManager {
    
    //create instance if database manager
    static let shared = DatabaseManager()
    //reference to the database
    private let database = Database.database().reference()
}
    // MARK: - Account Management

extension DatabaseManager {
    
    
    //completion handler Bool will return true if the user email exists and false if it doesnt
    public func userExists(with email: String,
                                completion: @escaping ((Bool) -> Void)) {
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        //getting the data out of the database i.e query database
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                //if not found so account creation will proceed
                completion(false)
                return
            }
            
            //if email if found pass in true
            completion(true)
        })
        
    }
    
    ///Insert new user to database
    public func insertUser(with user: ChatAppUser) {
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
            //key of the user is the email adress so there is no point adding it
        ])
    }
}
    
    
    //write function to insert data into the database
//    public func test() {
//        database.child("foo").setValue(["something": true])
//    }

    
    struct ChatAppUser {
        let firstName: String
        let lastName: String
        let emailAddress: String
        
        //computed property
        var safeEmail:String {
            var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
            safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
            return safeEmail
        }
        //let profilePictureUrl: String
    }
    //a no sql database is json i.e keys and values.child referes to key we write data to. e.g key can be the users email address
    
    

