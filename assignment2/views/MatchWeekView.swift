//
//  MatchWeekView.swift
//  assignment2
//
//  Created by Vo Tran Nhut Khanh on 1/12/20.
//

import SwiftUI

struct MatchWeekView: View {
    let listTimeMatchAvailableInCurrentWeek = DataLoader().listTimeMatchAvailableInCurrentWeek
    var body: some View {
        NavigationView {
            List{
                ForEach(listTimeMatchAvailableInCurrentWeek, id: \.self){ date in
                    Section(header: Text(date), content:{
                        ForEach(getMatchesBasedOnDate(date: date)){match in
                            MatchRow(match: match)
                        }
                    })
                }
            }.navigationBarTitle("Match Week", displayMode: .inline)
            .listStyle(GroupedListStyle())
        }.ignoresSafeArea(.all)
    }
}

struct MatchWeekView_Previews: PreviewProvider {
    static var previews: some View {
        MatchWeekView()
    }
}
