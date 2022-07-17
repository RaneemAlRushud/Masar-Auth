////
////  DisplayUserV.swift
////  Masar
////
////  Created by Raneem AlRashoud on 04/12/1443 AH.
////
//
//import SwiftUI
//struct DisplayUserView: View {
//    @EnvironmentObject var store: ObservableStore
//    
//    var body: some View {
//        VStack{
//            HStack{
//                Text("user: \(self.store.me?.email ?? "")")
//                Spacer()
//            }
//            .frame(maxWidth:.infinity)
//            .padding()
//            .overlay(
//                RoundedRectangle(cornerRadius:5)
//                    .stroke(Color.gray)
//                )
//                }
//                    .padding(5)
//                }
//}
