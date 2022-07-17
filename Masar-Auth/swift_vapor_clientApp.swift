////
////  swift_vapor_clientApp.swift
////  Masar
////
////  Created by Raneem AlRashoud on 04/12/1443 AH.
////
//
//import SwiftUI
//
//struct swift_vapor_clientApp: App {
//    let store: ObservableStore = ObservableStore()
//    var body: some Scene {
//        WindowGroup {
//            SigninC()
//        .environmentObject(store)
//        }
//    }
//}
//
//class ObservableStore: ObservableObject {
//    //🛑 Is it 8000 or 8080?
//    @Published var serverRoot = "http:// localhost:8080"
//   // @Published var todos = [Todo]()
//    @Published var me: MeM?
//    var token = ""
//    private static let storeQueue = DispatchQueue(label:
//        "StoreQueue")
//    
//    //Using dataTaskPublisher; to be on the main UI thread
//    
//    func setMe(token: String) {
//        let url = URL(string: "\(self.serverRoot)/users/login")
//        var urlReq = URLRequest(url: url!)
//        urlReq.setValue("application/json",
//        forHTTPHeaderField: "Content-Type")
//        //The token is in the header
//        urlReq.setValue("Bearer \(token)",
//                        forHTTPHeaderField: "Authorization")
//        urlReq.httpMethod = "Get"
//        let result = URLSession.shared.dataTask(with: urlReq) {(data, resp, err) in
//            print("setMe finished")
//            guard let gotData = data else {
//                print("failed to get data")
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let user = try decoder.decode(MeM.self, from: gotData)
//                self.me = user
//            } catch {
//                print("failed to decode user object")
//            }
//            
//        }
//        result.resume()
//        
//    }
//
//
//}
//    //    func setTodos(token:String){
//    //        let url=URL(string:"\(serverRoot)/todos")
//    //        var urlReq=URLRequest(url:url!)
//    //        urlReq.setValue("application/json",
//    //
//    //            forHTTPHeaderField:"Content-Type")
//    //        urlReq.setValue("Bearer\(token)",
//    //            forHTTPHeaderField:"Authorization")
//    //        urlReq.httpMethod="GET"
//    //          = URLSession.shared.dataTaskPublisher(for:urlReq)
//    //            .subscribe on:ObservableStore.storeQueue)
//    //            .map{
//    //                return$0.data
//    //            .decode(type:[Todo].self,decoder:
//    //            }
//    //                JSONDecoder())
//    //            .receive(on:DispatchQueue.main)
//    //            .sink{subscribe Completion in
//    //                switch subscribe Completion{
//    //                case .finished:
//    //            }
//    //                    print("got todos")
//    //                case .failure:
//    //                }
//    //                    print("failed to get todos")
//    //            receiveValue:{[weak self]todos in
//    //                self?.todos=todos
//    //            }}
