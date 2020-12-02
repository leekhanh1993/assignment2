//
//  MatchWeekView.swift
//  assignment2
//
//  Created by Vo Tran Nhut Khanh on 1/12/20.
//

import SwiftUI

struct MatchWeekView: View {
    let listTimeMatchinCurrentWeek = DataLoader().listTimeMatchinCurrentWeek
    var body: some View {
        NavigationView {
            List{
                ForEach(Array(listTimeMatchinCurrentWeek.keys), id: \.self){ date in
                    Section(header: Text(date), content:{
                        ForEach(Array(listTimeMatchinCurrentWeek[date]!)){match in
                            MatchRow(match: match)
                        }
                    })
                }
            }.navigationBarTitle("Match Week", displayMode: .inline)
            .listStyle(GroupedListStyle())
        }
    }
}

struct MatchWeekView_Previews: PreviewProvider {
    static var previews: some View {
        MatchWeekView()
    }
}
