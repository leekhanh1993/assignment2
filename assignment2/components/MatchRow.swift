//
//  MatchRow.swift
//  assignment2
//
//  Created by Vo Tran Nhut Khanh on 1/12/20.
//

import SwiftUI

struct MatchRow: View {
    let match: Match
    var body: some View {
        HStack {
            Spacer()
            Text(match.homeTeam.teamBasicInfo.name)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .frame(width: 100, height: nil, alignment: .trailing)
            Image(match.homeTeam.teamBasicInfo.nickName)
                .resizable()
                .frame(width: 35, height: 40)
            HStack{
                if(match.homeTeamScore != nil){
                    Text(String(match.homeTeamScore!))
                    Spacer()
                    Text("-")
                    Spacer()
                    Text(String(match.awayTeamScore!))
                }else{
                    Text(match.date.components(separatedBy: " ")[1])
                }
            }.frame(width: 50, height: nil, alignment: .center)
            Image(match.awayTeam.teamBasicInfo.nickName)
                .resizable()
                .frame(width: 35, height: 40)
            Text(match.awayTeam.teamBasicInfo.name)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .frame(width: 100, height: nil, alignment: .leading)
            Spacer()
        }
    }
}

struct MatchRow_Previews: PreviewProvider {
    static var previews: some View {
        MatchRow(match: getListMatch()[0])
            .previewLayout(.fixed(width: 450, height: 70))
    }
}
