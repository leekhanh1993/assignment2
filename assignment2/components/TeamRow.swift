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
                Text("Pos").frame(width: 50, height: nil, alignment: .leading)
                Text("Club").frame(width: 130, height: nil, alignment: .leading)
                Text("PL").frame(width: 25, height: nil, alignment: .leading)
                Text("W").frame(width: 20, height: nil, alignment: .leading)
                Text("R").frame(width: 20, height: nil, alignment: .leading)
                Text("L").frame(width: 20, height: nil, alignment: .leading)
                Text("GD").frame(width: 25, height: nil, alignment: .leading)
                Text("Pts").frame(width: 30, height: nil, alignment: .leading)
            }
        }else{
            HStack {
                Text(String(indexTeam! + 1))
                    .fontWeight(.bold)
                    .frame(width: 50, height: nil, alignment: .leading)
                HStack {
                    Image(team!.nickname).resizable()
                    .frame(width: 25.0, height: 25.0)
                    Text(team!.nickname)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(width: 100, height: nil, alignment: .leading)
                }
                Text(String(team!.matchesPlayed)).frame(width: 25, height: nil, alignment: .leading)
                Text(String(team!.numWon)).frame(width: 20, height: nil, alignment: .leading)
                Text(String(team!.numDrawn)).frame(width: 20, height: nil, alignment: .leading)
                Text(String(team!.numLost)).frame(width: 20, height: nil, alignment: .leading)
                Text(String(team!.goalsDifference)).frame(width: 25, height: nil, alignment: .leading)
                Text(String(team!.numPoints)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(width: 30, height: nil, alignment: .leading)
            }
        }
    }
}

struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow(indexTeam: nil, team: nil)
            .previewLayout(.fixed(width: 450, height: 70))
    }
}
