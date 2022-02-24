//
//  Car.swift
//  ListNavigationDemo
//
//  Created by 양준식 on 2022/02/24.
//

import SwiftUI

struct Car : Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
    
}
