//
//  SigninVC.swift
//  Masar
//
//  Created by Raneem AlRashoud on 27/11/1443 AH.
//

import UIKit

class SigninVC: UIViewController{
//    @IBOutlet var email: UITextField!
//    @IBOutlet var password: UITextField!
    
    @IBOutlet weak var email: CustomTextField!
    @IBOutlet weak var password: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    
    @IBAction func signinBtnTapped(_ sender: Any) {

        
        
        if(email.text?.isEmpty == true && password.text?.isEmpty == true ){
        print(" الرجاء تعبئة البريد الالكتروني وكلمة المرور")
            return
        }
                if email.text?.isEmpty == true {
                    //🛑Temp [text needs to be under the field itself]
                    print("الرجاء تعبئة البريد الالكتروني")
                    return
        
                }
        
                if password.text?.isEmpty == true {
                    //🛑Temp [text needs to be under the field itself]
                    print("الرجاء تعبئة كلمة المرور")
                    return
                }
        
                signIn()
    }
    

    @IBAction func forgetPasswordBtn(_ sender: Any) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                //Direct user when clicks on "هل نسيت كلمة المرور؟"
                let vc = storyboard.instantiateViewController(identifier: "forgetPassword")
                vc.modalPresentationStyle = .overFullScreen
                present(vc, animated: true)
    }

    

    
    func getUsersList(completion: @escaping ([UserAccRequest], Error?) -> Void) {
        MasarClient.GETRequest(url: MasarClient.Endpoint.UserAcc.url, responseType: [UserAccRequest].self) { response, error in
            if let response = response {
                print(response)
                completion(response, nil)
            } else {
                completion([], error)
            }
        }
    }
    
    func signIn(){
        var isEmailExisted = false
        var isPassMatched = false
        
        getUsersList(){
            UsersList, error in
            for u in UsersList {
                if(self.email.text == u.email){
                    isEmailExisted = true
                }
                
                if(self.password.text == u.password){
                    isPassMatched = true
                }
                
            }
        }
        
        if(!isEmailExisted){
            //
            print("الرجاء التأكد من صحة البريد الالكتروني")
            return
        }
        if(!isPassMatched){
            
            print("الرجاء التأكد من صحة كلمة المرور")
            return
        }
        if(isEmailExisted && isPassMatched){
            
         //Show sucessfull feedback
            print("GOT USER, المستخدم موجود")
            return
        //Direct user to home
            
        }
        
       else {
           print("المستخدم غير موجود")
           return
            // pop up
        }
        
    }
    
}

//Alert Shows the validations
