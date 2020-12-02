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

//get listTeam from DataLoader
let listTeam = DataLoader().listTeam



func getListTeam() -> [Team]{
    //update match information to each team
    updateInfoToTeams(listMatch: getListMatch())
    
    //sort list team based on team points
    let sortedListTeam = listTeam.sorted(by: {(team1,team2)->Bool in
        return team1.numPoints > team2.numPoints
    })
    
    return sortedListTeam
}
func getListMatch() -> [Match]{
    //Create and return a list match
    return createInfoToMatchList(matchInfoList: matchInfo, listTeam: listTeam)
}
