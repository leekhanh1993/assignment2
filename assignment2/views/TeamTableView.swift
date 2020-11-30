//
//  TeamTableView.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import SwiftUI

struct TeamTableView: View {
    let listTeams = getListTeam()
    var body: some View {
        NavigationView {
            List{
                Section(header: TeamRow(indexTeam: nil, team: nil)){
                    ForEach(listTeams){team in
                        NavigationLink(destination: TeamDetailView(team: team)) {
                            TeamRow(indexTeam: listTeams.firstIndex(where: {$0 === team}), team: team)
                        }
                    }
                }
            }.navigationBarTitle("Team Table")
            .listStyle(GroupedListStyle())
        }
    }
}

struct TeamTableView_Previews: PreviewProvider {
    static var previews: some View {
        TeamTableView()
    }
}
