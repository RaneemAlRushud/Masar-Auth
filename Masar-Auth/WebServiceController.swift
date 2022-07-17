//
//  WebService.swift
//  Masar
//
//  Created by Raneem AlRashoud on 08/12/1443 AH.
//

import SwiftUI
import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom (errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
   
}

struct LoginRequestBody: Codable{
    let email: String
    let password: String
}

struct LoginReqsponseBody: Codable{
    let token: String?
    let message: String?
    let success: Bool?
}


class WebService {
//    func getUsrProfileInfo(token: String, completion: @escaping (Result<[Profile], NetworkError>) -> Void) {
//        
//        guard let url = URL(string: "https://") else  {
//            completion(.failure(.invalidURL))
//            return
//        }
//        
//        var request = URLRequest(url:url)
//       // request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        request.addValue(token, forHTTPHeaderField: "Authorization")
//        
//        URLSession.shared.dataTask(with: request) { ( data, response, error) in
//            guard let data = data, error == nil else {
//                completion(.failure(.noData))
//                return
//            }
//            //Decode; Since it's(Profile obj) decodable [GET method]
//            guard let profile = try? JSONDecoder().decode([Profile].self, from: data) else {
//                completion(.failure(.decodingError))
//                return
//            }
//            
//            completion(.success(profile))
//            
//        }.resume()
//        
//        
//    }
    
    
    func signin(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
      
        
        guard let url = URL(string:"http://localhost:8888/Masar/php/auth/postSignin.php") else {
            completion(.failure(.custom(errorMessage:"URL is not correct")))
            return
        }
        
//        let body = LoginRequestBody(email: email, password: password)
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json",forHTTPHeaderField:"Content-Type")
        
        //Encode; Since it's(LoginRequestBody)codable [POST method]
        // here you encoded the body as a swift object!
        // it should be a json object.
        let dic : [String : Any] = [
            
            "emailInput" : email,
            "passwordInput" : password
            
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        
        request.httpBody = jsonData
        
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
            //We're going to extract the data
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            //Decode; Since it's(LoginReqsponseBody obj) decodable [GET method]
            guard let loginResponse = try? JSONDecoder().decode(LoginReqsponseBody.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
            
        }.resume()
        
        
        
    }
    
}
