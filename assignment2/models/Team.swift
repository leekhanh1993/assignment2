/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2020C
  Assessment: Assignment 1
  Author: Vo Tran Nhut Khanh
  ID: 3694787
  Created  date: 11/11/2020
  Last modified: dd/mm/yyyy (e.g. 05/04/2020)
  Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation

class Team: Identifiable{
    var name: String
    var nickname: String {
        if(self.name == "Man Utd"){
            return "MUN"
        }else if(self.name == "West Ham"){
            return "WHU"
        }else if(self.name == "Spurs"){
            return "TOT"
        }else{
            //get three fisrt letter
            let char1 = String(self.name[0]).uppercased()
            let char2 = String(self.name[1]).uppercased()
            let char3 = String(self.name[2]).uppercased()
            return "\(char1 + char2 + char3)"
        }
        
    }
    
    var matchesPlayed = 0
    var numWon = 0
    var numDrawn = 0
    var numLost = 0
    var goalsFor = 0
    var goalsAgainst = 0
    var lastFiveMatch: [String] = []
    var goalsDifference: Int {
        return self.goalsFor - self.goalsAgainst
    }
     var numPoints: Int {
        return (self.numWon * 3) + self.numDrawn
    }
    
    init(_ name:String) {
        self.name = name
    }
    
    //get a string information of the team in a row
    func getStringTeamInfo()->String{
        return "\(self.name)".withCString{
            String(format: "%-10s %3d %3d %3d %3d %3d %3d %3d %3d", $0, self.matchesPlayed,
                   self.numWon,self.numDrawn, self.numLost, self.goalsFor, self.goalsAgainst, self.goalsDifference, self.numPoints)
        }
    }
    
    //generate a las five match string
    private func createLastFiveMatchStr()->String{
        var tmpStr = String()
        for index in stride(from: self.lastFiveMatch.endIndex - 1, to: self.lastFiveMatch.startIndex - 1, by: -1){
            tmpStr += self.lastFiveMatch[index] + " "
        }
        return tmpStr
    }
    
}

extension StringProtocol {
    subscript(offset: Int) ->Character{
        self[index(startIndex, offsetBy: offset)]
    }
}
