//
//  Signin.swift
//  Masar
//
//  Created by Raneem AlRashoud on 08/12/1443 AH.
//

import Foundation
import SwiftUI

class SignInOutModel: ObservableObject {
    @State var email: String = ""
    @State var password: String = ""
    //To let user know that, auth is proccesed sucessfully
    @Published var isAuthenticated: Bool = false
    @State var showProfileView: Bool = false

    
    
    
    
    func signinController(loginEmail : String, loginPassword : String, completion: @escaping(_ success : Bool) -> Void) {
        //To save the token in the client side (in our case iPhone app) for the forthcoming operations (ex., CRUD)
        let defaults = UserDefaults.standard
        
        WebService().signin(email: loginEmail, password: loginPassword) { result in
            
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "0private$$")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    completion(true)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
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
