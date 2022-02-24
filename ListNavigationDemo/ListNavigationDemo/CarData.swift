//
//  CarData.swift
//  ListNavigationDemo
//
//  Created by 양준식 on 2022/02/24.
//

import UIKit
import SwiftUI

var carData: [Car] = loadJson("carData.json")


func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // guard문 - file이 nil이면 else문 안쪽 실행 아니면 건너뜀
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("\(filename) not found")
    }
    do{
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): (error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): (error)")
    }
}
