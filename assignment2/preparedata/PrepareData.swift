//
//  PrepareData.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import Foundation
func getListTeam() -> [Team]{
    //create a dictionary to store teams
        let listNameTeam = ["Fulham", "Arsenal", "Crystal Palace", "Southampton", "Liverpool", "Leeds",
        "West Ham", "Newcastle", "West Brom", "Leicester", "Spurs", "Everton", "Sheffield Utd", "Wolves",
        "Brighton", "Chelsea", "Man Utd", "Man City", "Burnley", "Aston Villa"]


        //create team instances based on list Name Team and add into listTeam
        var listTeam: [String:Team] = [:]
        for ele in listNameTeam{
            listTeam[ele] = Team(ele)
        }

        //Read File csvfile.csv
        var matchInfoList = readFile(nameURL: "csvfile", typeFile: "csv")!

        //Create a list match
        let listMatch = createInfoToMatchList(matchInfoList: &matchInfoList, listTeam: listTeam)

        //update match information to each team
        updateInfoToTeams(listMatch: listMatch)

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
