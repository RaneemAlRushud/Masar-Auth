//
//  ProfileView.swift
//  Masar
//
//  Created by Raneem AlRashoud on 08/12/1443 AH.
//

import SwiftUI
import Combine
import Foundation

struct ProfileView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var showEditForm = false
    @State var showingAlert = false
    @StateObject private var signoutControllerObj = SignInOutModel()

    
    var body: some View {
        
        GeometryReader{_ in
            
            
//  NavigationLink(destination: EditProfileV(username: PViewModel.KaleemUser.name, phoneNo: PViewModel.KaleemUser.phoneNo, email: PViewModel.KaleemUser.email, type: PViewModel.KaleemUser.type,userID: PViewModel.KaleemUser.id) , isActive: $showEditForm, label: {EmptyView()} )
            
        
            VStack{
                
                Button(action: {
                    signoutControllerObj.signoutController()
                    showingAlert = true
                }, label: {
                    HStack{
                    Text("تسجيل الخروج")
                            .underline()
                        .foregroundColor(Color("logoutColor"))
                        .frame(width: 100, height: 50)
                        .padding(.trailing, -100)
                    
                    
                    Image("logout").resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 100)
                    }
                    
                   
                })
                    .padding(.top, 20)
                    .padding(.leading,200)
                    .alert("هل أنت متأكد من تسجيل الخروج؟", isPresented: $showingAlert, actions: {
                          Button("نعم", action: {
                              signoutControllerObj.signoutController()
                          })
                          Button("لا", role: .cancel, action: {})
                        })
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("basic"))
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                            .clipped()
                            .overlay(Circle().stroke(Color.white, lineWidth: 0))
                        
                    }
                    Spacer()
                }.cornerRadius(20)
                    .padding(.top,30)
                    .padding(.bottom,40)
                
                
                
                
       
                    VStack{
                        HStack{
                            Text("المعلومات الشخصية")
                                .foregroundColor(.black).opacity(0.6)
                                .font(.title2)
                           
                        }
                        
                        
                        VStack(alignment: .trailing ){
                            HStack(spacing: 15)  {
                                Text("").foregroundColor(.black.opacity(0.6))
 
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("basic"))
                                
                            }
                            Divider().background(Color(.gray).opacity(0.01))
                        }
                        .padding(.horizontal)
                        .padding(.top,20)
                        
                        
                        VStack(alignment: .trailing ){
                            HStack( spacing: 15)  {
                                Text("").foregroundColor(.black.opacity(0.6))

                                
                                Image(systemName: "phone.fill")
                                    .foregroundColor(Color("basic"))
                                
                            }
                            Divider().background(Color(.gray).opacity(0.01))
                            
                        }
                        .padding(.horizontal)
                        .padding(.top,20)
                        
                        
                        VStack(alignment: .trailing ){
                            HStack(spacing: 15)  {
                                Text("").foregroundColor(.black.opacity(0.6))
                            
                                
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(Color("basic"))
                                
                            }
                            Divider().background(Color(.gray).opacity(0.0))
                        }
                        
                        .padding(.horizontal)
                        .padding(.top,20)
                    
                    Button(action: {
                          //  showEditForm = true
                        showingAlert = true
                        }) {
                        Text("تعديل")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal,50)
                            .background(Color("basic"))
                            .clipShape(Capsule())
                            .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
                    }
                       .padding(.top, 26)
                       .alert("هل أنت متأكد من تسجيل الخروج؟", isPresented: $showingAlert, actions: {
                             Button("نعم", action: {
                                 signoutControllerObj.signoutController()
                             })
                             Button("لا", role: .cancel, action: {})
                           })
        
                    }
                    /*CONTAINER*/
                 
                    .padding()
                    .padding(.bottom, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal,20)

                
                

                
            }
            .padding(.top,-100)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
                .navigationBarHidden(true)
       
        }
      
    }
}


extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
