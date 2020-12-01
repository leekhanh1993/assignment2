//
//  PrepareData.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import Foundation

//get data from basicTeamData.json
let basicTeamData = DataLoader().teamBasicInfo

//get data from basicTeamData.json
let matchInfo = DataLoader().matchInfo
//create team instances based on list Name Team and add into listTeam
private var listTeam: [Team] = []


func getListTeam() -> [Team]{
    for team in basicTeamData{
        listTeam.append(Team(team))
    }
    //update match information to each team
    updateInfoToTeams(listMatch: getListMatch())
    
    
    
    //sort list team based on team points
    let sortedListTeam = listTeam.sorted(by: {(team1,team2)->Bool in
        return team1.numPoints > team2.numPoints
    })
    
    return sortedListTeam
}
func getListMatch() -> [Match]{
    for team in basicTeamData{
        listTeam.append(Team(team))
    }

    //Create and return a list match
    return createInfoToMatchList(matchInfoList: matchInfo, listTeam: listTeam)
}
