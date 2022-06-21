//
//  DataLoader.swift
//  DimkaDZ
//
//  Created by Вадим on 23.05.2022.
//

import Foundation

public class DataLoader {
     
    var userData = [Model]()
    
    init() {
        load()
        sort()
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "comments", withExtension: "json") {
             
            do {
                
                let data = try Data(contentsOf: fileLocation )
                let decoder = JSONDecoder()
                let dataFromJson = try decoder.decode([Model].self, from: data)
                
                self.userData = dataFromJson
                
            } catch {
                
                print(error)
                
            }
        }
    }
    
    func sort() {
        self.userData = self.userData.sorted(by: {$0.id < $1.id})
    }
}
 
