//
//  PrepareData.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import Foundation
//create an array team name
private let listNameTeam = ["Fulham", "Arsenal", "Crystal Palace", "Southampton", "Liverpool", "Leeds",
                            "West Ham", "Newcastle", "West Brom", "Leicester", "Spurs", "Everton", "Sheffield Utd", "Wolves",
                            "Brighton", "Chelsea", "Man Utd", "Man City", "Burnley", "Aston Villa"]
//create an array stadium info
private let listStadiumName = ["Craven Cottage", "Emirates Stadium", "Selhurst Park","St. Mary's Stadium", "Anfield", "Elland Road",
                               "West Ham", "Newcastle", "West Brom", "Leicester", "Spurs", "Everton", "Sheffield Utd", "Wolves",
                               "Brighton", "Chelsea", "Man Utd", "Man City", "Burnley", "Aston Villa"]

//create an array capacity of stadium for each team
private let listStadiumCapacity = [19000, 60260, 25486, 32384, 53394, 37890]

//create team instances based on list Name Team and add into listTeam
private var listTeam: [String:Team] = [:]

func getListTeam() -> [Team]{
    for ele in listNameTeam{
        listTeam[ele] = Team(ele)
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
    for ele in listNameTeam{
        listTeam[ele] = Team(ele)
    }
    //Read File csvfile.csv
    var matchInfoList = readFile(nameURL: "csvfile", typeFile: "csv")!
    
    //Create and return a list match
    return createInfoToMatchList(matchInfoList: &matchInfoList, listTeam: listTeam)
}
