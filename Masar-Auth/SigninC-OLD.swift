////
////  SigninC.swift
////  Masar
////
////  Created by Raneem AlRashoud on 04/12/1443 AH.
////
//
//import SwiftUI
//
//struct SigninC: View {
//    //It will tocken that saved in the permanent local storage
//    @AppStorage("token") var token = ""
//    @EnvironmentObject var store: ObservableStore
//    @State var showLogin = false
//    @State var email = "dave"
//    @State var password = "Test123"
//    
//    var body: some View {
//        VStack(spacing: 10){
//            Button {
//                self.showLogin = true
//            } label: {
//                Text("تسجيل دخول")
//            }
//            Spacer()
//        }
//        .onAppear {
//            
//            store.setMe(token: token)
//        }
//        .sheet(isPresented: $showLogin){
//            Form {
//                
//                HStack {
//                    Text("البريد الالكتروني")
//                    TextField("", text: $email)
//                }
//                
//                HStack {
//                   Text("كلمة السر")
//                    TextField("", text: $email)
//                }
//                
//                Button {
//                    self.showLogin = true
//                } label: {
//                    Text("تسجيل دخول")
//                }
//                
//            }
//            
//        }
//    }
//
//func login(){
//    do{
//        let url = URL(string: "\(self.store.serverRoot)/users/login")
//        var urlReq = URLRequest(url: url!)
//        urlReq.setValue("application/json",
//                        forHTTPHeaderField: "Content-Type")
//        urlReq.httpMethod = "POST"
//        
//        let encoder = JSONEncoder()
//        let payload = try encoder.encode( UserLogin(email: self.email, password: self.password))
//        print("login payload \(payload)")
//        URLSession.shared.uploadTask(with: urlReq, from:
//                                        payload) { (data, resp, err) in
//            print("login attempt complete")
//            guard let data = data else {
//                print("login failed")
//                return
//            }
//            
//            let token = String(data: data, encoding: String.Encoding.utf8)
//            print("login token \(String(describing: token))")
//            self.showLogin = false
//            self.token = token ?? ""
//            self.store.setMe(token: self.token)
//            //self.store.setTodos(token: self.token)
//        }
//            .resume()
//    } catch {
//        print("Login failed during call")
//    }
//}
//
//
//
//
//}
//struct SigninC_Previews: PreviewProvider {
//    static var previews: some View {
//        SigninC()
//    }
//}
