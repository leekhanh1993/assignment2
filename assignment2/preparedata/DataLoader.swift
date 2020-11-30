//
//  DataLoader.swift
//  assignment2
//
//  Created by Vo Tran Nhut Khanh on 1/12/20.
//

import Foundation

struct TeamBasicInfo: Codable, Hashable{
    
    var name: String
    var fullName: String
    var nickName: String
    var stadiumInfo: StadiumInfo
    var contact:  Contact
    
}

struct StadiumInfo: Codable,Hashable{
    var name: String
    var capacity: Int
    var built: String
    var pitchSize: String
    var address: String
}

struct Contact: Codable, Hashable{
    var phone: String
    var officialWebsite: String
}

public class DataLoader{
    @Published var teamBasicInfo = [TeamBasicInfo]()
    
    init() {
        load()
    }
    
    func load() {
        if let url = Bundle.main.url(forResource: "basicTeamData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([TeamBasicInfo].self, from: data)
                self.teamBasicInfo = dataFromJson
            } catch {
                    print(error)
            }
        }
    }
}
