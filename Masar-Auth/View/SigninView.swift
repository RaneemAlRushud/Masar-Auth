//
//  SigninView.swift
//  Masar
//
//  Created by Raneem AlRashoud on 08/12/1443 AH.
//

import SwiftUI

struct SigninView: View {
    @ObservedObject private var signinControllerObj = SignInOutModel()
    @ObservedObject private var signoutControllerObj = SignInOutModel()
    @State var showTabBar: Bool = false
    
    @State var loginEmail : String = ""
    @State var loginPassword : String = ""
    
    var body: some View {
        
        NavigationView {
        GeometryReader{_ in
    
            VStack(alignment: .center){
               // TopBar()
                
             
                //TO NAVIGATE TO FORGOT PASSWORD PAGE
//               NavigationLink(destination: , isActive: $showResetPassword, label: {EmptyView()} )
              
                //TO NAVIGATE TO SIGN UP PAGE
//NavigationLink(destination: TabBar(), isActive: $showTabBar, label: {EmptyView()} )
                NavigationLink(destination: TabBarView(), isActive: $showTabBar, label: {EmptyView()} )
                
                HStack(alignment: .center, spacing: 0){
                Image("Masar-1")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 250.0, height: 250.0)
           
                }
               Text("مرحبا بك مجددًا")
                    .foregroundColor(.black)
                    .font(.title)
                    
                 //   .fontWeight(.bold)
                    .padding(.bottom, 30)
                    .padding(.top, -40)
                
                VStack{
                    HStack{
                        Text("تسجيل دخول")
                            .foregroundColor(.black)
                            .font(.title2)
                        
                           // .fontWeight(.bold)
                    }
                    
                    
                    /* EMAIL FIELD*/
                    VStack{
                        HStack(spacing: 15)  {
                            TextField("البريد الإلكتروني", text: $loginEmail)
                                .disableAutocorrection(true)
                                .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)


                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("basic"))
                            
                        }
                        Divider().background(Color("basic").opacity(0.5))
                    }
                    
                    .padding(.horizontal)
                    .padding(.top,20)
                
                    /*PASS FIELD*/
                    SecureInputView("كلمة المرور", text: $loginPassword)
              
/* COMPARE THE VALIDATIONS FROM POSTMAN*/
                    
//                    if (error) {
//
//                        Text("معلومات الدخول غير صحيحة ، حاول مرة أخرى")
//                            //.offset(y: -10)
//                            .foregroundColor(.red).padding(.top,13)
//                    }
//                    else {
//                        Text(" ").foregroundColor(.red).padding(.top,13)
//                    }
                    
                    //FORGET PASS
//                HStack{
//
//                    Button(action: {
//                       // self.showResetPassword = true
//                    }){
//                        Text("هل نسيت كلمة المرور؟")
//                            .foregroundColor(Color("Kcolor"))
//
//                            .underline()
//
//                    }
//            }
//                .padding(.horizontal)
//                .padding(.top,10)
                    
                    
            
                }// the big one
   
                
                /*CONTAINER*/
                .padding()
                .padding(.bottom, 50)
                /*WITHIT OR WITHOUT IT?*/
              //  .background(Color.gray.opacity(0.1))
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal,20)
                
                /*BUTTON*/
//                Button(action: signinControllerObj.signinController()){
//                    Text("دخول")
//                        .foregroundColor(Color.white)
//                        .fontWeight(.bold)
//                        .padding(.vertical)
//                        .padding(.horizontal,50)
//                        .background(Color("basic"))
//                        .clipShape(Capsule())
//                        .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
//                }
                
                Button(action: {
                    signinControllerObj.signinController(loginEmail: loginEmail, loginPassword: loginPassword, completion: { success in
                        
                        if (success)
                        {showTabBar = true}
                        
                        else {
                            
                            print("show unauth msg")
                        }
                        
                        
                    })
                })
                    
                {
              
                    Text("دخول")
                    .foregroundColor(Color.white)
                    .frame(width: 150, height: 50)
                    .background(Color("basic"))
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)
                    .offset(y:25)
                    .padding(.horizontal)
                    .padding(.top,5)
                }
 
                
                
                
                /*SIGN UP*/
                VStack{
                    HStack(spacing: 6)  {
                        
                        Button(action: {
                    
                        })
                        {
                            Text("سجل الآن")
                                .foregroundColor(Color("basic"))
                                .underline()
                        }
                        Text("ليس لديك حساب؟")
                            .foregroundColor(Color.black.opacity(0.8))
                          
                      
                }
                    }
                
                .padding(.horizontal)
                .padding(.top,60)
                
            }
            
            
            
                
            } .navigationBarTitle("")
            .navigationBarHidden(true)


   
        .background(Color(.white).edgesIgnoringSafeArea(.all))
        }
      
    }
}







struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        VStack{
        HStack(spacing: 15)  {
            if isSecured {
                SecureField(title, text: $text).multilineTextAlignment(TextAlignment.trailing)

            } else {
                TextField(title, text: $text)
                    .disableAutocorrection(true)
                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)

            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .foregroundColor(Color("basic"))
            }
        }
            Divider().background(Color("basic").opacity(0.5))
                           }
                    .padding(.horizontal)
                    .padding(.top,30)
}
}




struct SignIn_Previews: PreviewProvider{
    static var previews: some View{
        SigninView()
    }
}
