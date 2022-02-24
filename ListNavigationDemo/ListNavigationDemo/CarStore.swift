//
//  CarStore.swift
//  ListNavigationDemo
//
//  Created by 양준식 on 2022/02/24.
//

import SwiftUI
import Combine

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init (cars: [Car] = []) {
        self.cars = cars
    }
}
