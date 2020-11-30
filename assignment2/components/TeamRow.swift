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
                Group{
                    Text("Pos").frame(width: 40, height: nil, alignment: .center)
                    Spacer()
                    Text("Club").frame(width: 90, height: nil, alignment: .leading)
                    Spacer()
                    Text("PL").frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                    Text("W").frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                    Text("R").frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                }
                
                Text("L").frame(width: 20, height: nil, alignment: .center)
                Spacer()
                Text("GD").frame(width: 25, height: nil, alignment: .center)
                Spacer()
                Text("Pts").frame(width: 40, height: nil, alignment: .leading)
            }
        }else{
            HStack {
                Group{
                    Text(String(indexTeam! + 1))
                        .fontWeight(.bold)
                        .frame(width: 40, height: nil, alignment: .center)
                    Spacer()
                    HStack {
                        Image(team!.nickname).resizable()
                            .frame(width: 25.0, height: 25.0)
                        Text(team!.nickname)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 60, height: nil, alignment: .leading)
                    }
                    Spacer()
                    Text(String(team!.matchesPlayed)).frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                    Text(String(team!.numWon)).frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                    Text(String(team!.numDrawn)).frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                }
                Text(String(team!.numLost)).frame(width: 20, height: nil, alignment: .center)
                Spacer()
                Text(String(team!.goalsDifference)).frame(width: 25, height: nil, alignment: .center)
                Spacer()
                Text(String(team!.numPoints))
                    .fontWeight(.bold)
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
