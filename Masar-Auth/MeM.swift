//
//  MeM.swift
//  Masar
//
//  Created by Raneem AlRashoud on 04/12/1443 AH.
//

import SwiftUI


struct  MeM : Codable {
    
    let id : UUID
    let email : String
    let password : String
    
    enum CodingKeys: String, CodingKey{
        case id
        case email
        case password
       
    }
    
}
