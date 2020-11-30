//
//  PrepareData.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import Foundation

//get data from basicTeamData.json
let basicTeamData = DataLoader().teamBasicInfo
//create team instances based on list Name Team and add into listTeam
private var listTeam: [String:Team] = [:]


func getListTeam() -> [Team]{
    for team in basicTeamData{
        listTeam[team.name] = Team(team)
    }
    //update match information to each team
    updateInfoToTeams(listMatch: getListMatch())
    
    //sort list team based on team points
    let sortedListTeam = listTeam.sorted(by: {(arg0, arg1) -> Bool in
        let (_, valueTeamA) = arg0
        let (_, valueTeamB) = arg1
        return valueTeamA.numPoints > valueTeamB.numPoints
    })
    
    //create a new array to store Teams
    var listTeams: [Team] = []
    for team in sortedListTeam{
        listTeams.append(team.value)
    }
    return listTeams
}
func getListMatch() -> [Match]{
    for team in basicTeamData{
        listTeam[team.name] = Team(team)
    }
    //Read File csvfile.csv
    var matchInfoList = readFile(nameURL: "csvfile", typeFile: "csv")!
    
    //Create and return a list match
    return createInfoToMatchList(matchInfoList: &matchInfoList, listTeam: listTeam)
}
