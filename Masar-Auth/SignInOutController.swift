//
//  Signin.swift
//  Masar
//
//  Created by Raneem AlRashoud on 08/12/1443 AH.
//

import Foundation
import SwiftUI

class SignInOutModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    //To let user know that, auth is proccesed sucessfully
    @Published var isAuthenticated: Bool = false
    @State var showProfileView: Bool = false

    
    
    
    
    func signinController() {
        //To save the token in the client side (in our case iPhone app) for the forthcoming operations (ex., CRUD)
        let defaults = UserDefaults.standard
        
        WebService().signin(email: email, password: password) { result in
            
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "0private$$")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
 
        
    }
    
    
    func signoutController() {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "0private$$")
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
        
        
    }
    
}
