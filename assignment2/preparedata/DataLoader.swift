//
//  DataLoader.swift
//  assignment2
//
//  Created by Vo Tran Nhut Khanh on 1/12/20.
//

import Foundation

struct MatchInfo: Codable, Hashable{
    var roundNumber: Int
    var date: String
    var location: String
    var homeTeam: String
    var awayTeam: String
    var result: String?
}

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
    @Published var matchInfo = [MatchInfo]()
    
    init() {
        loadTeamBasicInfo()
        loadMatchInfo()
    }
    
    func loadTeamBasicInfo() {
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
    func loadMatchInfo() {
        if let url = Bundle.main.url(forResource: "matchData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([MatchInfo].self, from: data)
                self.matchInfo = dataFromJson
            } catch {
                    print(error)
            }
        }
    }
}
