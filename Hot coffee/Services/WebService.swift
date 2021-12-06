//
//  WebService.swift
//  Hot coffee
//
//  Created by nayan.khadase on 03/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

//struct Resource<T: Codable> {
//    let url: URL
//}
class WebService{
//    func load(fileName: String, completion: @escaping ([Order]?) -> Void){
//
//        if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json"){
//            do{
//                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
//                guard let jsonDataDecoded = try? JSONDecoder().decode([Order].self, from: jsonData!) else{
//                    fatalError("error while json decoding: ")
//                }
//                //completion(jsonData)
//                print("jsonData: \(jsonDataDecoded)")
//                completion(jsonDataDecoded)
//            }catch{
//                print("errors while getting json data \(error)")
//                completion(nil)
//            }
//        }
//
//    }
    

    
    
    func load(fileName: String, completion: @escaping ([Order]?) -> Void){
        
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let url = documentDirectoryUrl.appendingPathComponent("\(fileName).json")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("error while getting data \(error.localizedDescription)")
                completion(nil)
            }else if let data = data{
                let jsonData = try? JSONDecoder().decode([Order].self, from: data)
                completion(jsonData)
            }
            }.resume()
    }
    
    
    func writeData(for fileName: String, orderDetails: [Order]){
        
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let jsonFilePath = documentDirectoryUrl.appendingPathComponent("ordersList.json")
        
        
        do{
            
            let encoder = JSONEncoder()
            let JsonData = try encoder.encode(orderDetails)
            //print(JsonData.debugDescription)
            try JsonData.write(to: jsonFilePath)
            print("data added successfully")
        }catch{
            fatalError("error while encoding data: ")
        }
    }
    
    
}




