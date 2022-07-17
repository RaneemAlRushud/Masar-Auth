//
//  ServiceProviderTabBar.swift
//  Masar
//
//  Created by Raneem AlRashoud on 11/12/1443 AH.
//

import SwiftUI
struct TabBarView : View {
    @State private var selected = 0
    @State var type: String = ""
    var body: some View {


//        switch type {
//        case "SP":
//         return  ServiceProviderTabBar()
//
//        case "TD":
//            return   ServiceProviderTabBar()
//
//
//        default:
//            return noView()
//        }


 

               TabView(selection: $selected) {

                   ProfileView().navigationBarTitle("")
                       .navigationBarHidden(true)
                       .tag(0)
                       .tabItem {
                           Image (systemName: "person")
                           Text("حسابك")
                       }



       //            SignToTextV().navigationBarHidden(true)
       //                .tag(1)
       //                .tabItem {
       //                    Image (systemName: "hand.raised")
       //                    Text("الترجمة")
       //                }
       //
       //            FavoriteListV().navigationBarHidden(true)
       //                .tag(2)
       //                .tabItem {
       //                    Image (systemName: "heart")
       //                    Text("المفضلة")
       //                }
       //
       //
       //
                   TestView().navigationBarHidden(true)
                       .tag(1)
                       .tabItem {
                           Image(systemName: "house")
                           Text("الرئيسية")
       
                       }

               }
               .accentColor((Color("basic")))

        


    }

}

struct ServiceProviderTabBar: View {

    @State private var selected = 0
    var body: some View {

           TabView(selection: $selected) {

               ProfileView().navigationBarHidden(true)
                   .tag(0)
                   .tabItem {
                       Image (systemName: "person")
                       Text("حسابك")
                   }



   //            SignToTextV().navigationBarHidden(true)
   //                .tag(1)
   //                .tabItem {
   //                    Image (systemName: "hand.raised")
   //                    Text("الترجمة")
   //                }
   //
   //            FavoriteListV().navigationBarHidden(true)
   //                .tag(2)
   //                .tabItem {
   //                    Image (systemName: "heart")
   //                    Text("المفضلة")
   //                }
   //
   //
   //
   //            HomeAll().navigationBarHidden(true)
   //                .tag(3)
   //                .tabItem {
   //                    Image(systemName: "house")
   //                    Text("الرئيسية")
   //
   //                }

           }
           .accentColor((Color("basic")))

        }
        }

struct noView: View {


    var body: some View {
        return Text( "unauth")
    }

    }
//
//struct ServiceProviderTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//       TabBarView()
//    }
//}
