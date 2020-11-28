//
//  TeamRow.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import SwiftUI

struct TeamRow: View {
    var indexTeam: Int?
    var team: Team?
    var body: some View {
        if (team == nil) {
            HStack {
//                Text("Pos".withCString{
//                    String(format: "%-10s%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@", $0, "Club", "PL","W","R","L","GF","GA","GD","Pts")
//                })
//                .font(.system(size: 14))
                Text("Pos").frame(width: 30, height: nil, alignment: .leading)
                Text("Club").frame(width: 130, height: nil, alignment: .leading)
                Text("PL")
                Text("W")
                Text("R")
                Text("L")
                Text("GD")
                Text("Pts")
            }
        }else{
            HStack {
//                Text(String(indexTeam! + 1) + "\t\t" + team!.getStringTeamInfo())
//                    .font(.system(size: 14))
                Text(String(indexTeam! + 1))
                    .frame(width: 30, height: nil, alignment: .leading)
                Text(team!.name)
                    .frame(width: 130, height: nil, alignment: .leading)
                Text(String(team!.matchesPlayed))
                Text(String(team!.numWon))
                Text(String(team!.numDrawn))
                Text(String(team!.numLost))
                Text(String(team!.goalsDifference))
                Text(String(team!.numPoints))
            }
        }
    }
}

struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow(indexTeam: 0, team: getListTeam()[0])
    }
}
