/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2020C
 Assessment: Assignment 1
 Author: Vo Tran Nhut Khanh
 ID: 3694787
 Created  date: 12/11/2020
 Last modified: dd/mm/yyyy (e.g. 05/04/2020)
 Acknowledgement: Acknowledge the resources that you use here.
 */

import Foundation


//read file
func readFile(nameURL: String, typeFile: String)-> [String]?{
    //Read csv and clean data and put valid data in eplData variable
    if let path = Bundle.main.url(forResource: nameURL, withExtension: typeFile) {
        do {
            let data = try String(contentsOf: path, encoding: .utf8)
            return data.components(separatedBy: .newlines)
        } catch {
            print("Read file error!!!")
            return nil
        }
    }else{
        return nil
    }
}

//create match information to a match list and return it
func createInfoToMatchList(matchInfoList: [MatchInfo], listTeam: [Team])-> [Match]{
    var matchList: [Match] = []
    var homeTeamScore,awayTeamScore: Int?
    var homeTeam, awayTeam: Team
    for match in matchInfoList{
        //get home team and away team
        homeTeam = listTeam.first(where: {$0.teamBasicInfo.name == match.homeTeam})!
        awayTeam = listTeam.first(where: {$0.teamBasicInfo.name == match.awayTeam})!
        //get score for home team and away team
        if(match.result != ""){
            let arrayScore =  match.result!.components(separatedBy: " - ")
            homeTeamScore = Int(arrayScore[0])
            awayTeamScore = Int(arrayScore[1])
        }else{
            homeTeamScore = nil
            awayTeamScore = nil
        }
        //add new match to match list
        matchList.append(Match(homeTeam: homeTeam, awayTeam: awayTeam, date: match.date, location: match.location, homeTeamScore: homeTeamScore, awayTeamScore: awayTeamScore))
    }
    return matchList
}


//This function will use data information of list match and put them to each team
func updateInfoToTeams( listMatch: [Match]){
    for match in listMatch.filter({$0.awayTeamScore != nil}){
        let homeTeam = match.homeTeam
        let awayTeam = match.awayTeam
        //create variable score for both team
        let scoreHomeTeam = match.homeTeamScore
        let scoreAwayTeam = match.awayTeamScore
        
        //update match played for both team
        homeTeam.matchesPlayed += 1
        awayTeam.matchesPlayed += 1
        
        //update GoalsFor and GoalsAgainst
        homeTeam.goalsFor += scoreHomeTeam!
        homeTeam.goalsAgainst += scoreAwayTeam!
        
        awayTeam.goalsFor += scoreAwayTeam!
        awayTeam.goalsAgainst += scoreHomeTeam!
        
        //update Won, Drawn, Lost and Las Five Match for each team
        if(scoreHomeTeam! > scoreAwayTeam!){
            //for home team
            homeTeam.numWon += 1
            if(homeTeam.lastFiveMatch.count >= 5){
                homeTeam.lastFiveMatch.remove(at: 0);
                homeTeam.lastFiveMatch.append("\u{2705}")
            }else{
                homeTeam.lastFiveMatch.append("\u{2705}")
            }
            
            //for away team
            awayTeam.numLost += 1
            if(awayTeam.lastFiveMatch.count >= 5){
                awayTeam.lastFiveMatch.remove(at: 0);
                awayTeam.lastFiveMatch.append("\u{274C}")
            }else{
                awayTeam.lastFiveMatch.append("\u{274C}")
            }
            
        }else if(scoreHomeTeam! < scoreAwayTeam!){
            //for home team
            homeTeam.numLost += 1
            if(homeTeam.lastFiveMatch.count >= 5){
                homeTeam.lastFiveMatch.remove(at: 0);
                homeTeam.lastFiveMatch.append("\u{274C}")
            }else{
                homeTeam.lastFiveMatch.append("\u{274C}")
            }
            //for away team
            awayTeam.numWon += 1
            if(awayTeam.lastFiveMatch.count >= 5){
                awayTeam.lastFiveMatch.remove(at: 0);
                awayTeam.lastFiveMatch.append("\u{2705}")
            }else{
                awayTeam.lastFiveMatch.append("\u{2705}")
            }
            
        }else{
            //for home team
            homeTeam.numDrawn += 1
            if(homeTeam.lastFiveMatch.count >= 5){
                homeTeam.lastFiveMatch.remove(at: 0);
                homeTeam.lastFiveMatch.append("\u{2796}")
            }else{
                homeTeam.lastFiveMatch.append("\u{2796}")
            }
            //for away team
            awayTeam.numDrawn += 1
            if(awayTeam.lastFiveMatch.count >= 5){
                awayTeam.lastFiveMatch.remove(at: 0);
                awayTeam.lastFiveMatch.append("\u{2796}")
            }else{
                awayTeam.lastFiveMatch.append("\u{2796}")
            }
        }
        
        
    }
}
