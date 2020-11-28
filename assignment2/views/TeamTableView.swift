//
//  TeamTableView.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import SwiftUI

struct TeamTableView: View {
    var listTeams = getListTeam()
    var body: some View {
        NavigationView {
            List{TeamRow(indexTeam: nil, team: nil)
                ForEach(listTeams){ team in
                    TeamRow(indexTeam: listTeams.firstIndex(where: {$0 === team}), team: team)
                }
            }.navigationBarTitle("Team Table")
        }
    }
}

struct TeamTableView_Previews: PreviewProvider {
    static var previews: some View {
        TeamTableView()
    }
}
