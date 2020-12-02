//
//  MatchWeekView.swift
//  assignment2
//
//  Created by Vo Tran Nhut Khanh on 1/12/20.
//

import SwiftUI

struct MatchWeekView: View {
    let listTimeMatch = DataLoader().listTimeMatch
    var body: some View {
        NavigationView {
            List{
                ForEach(Array(listTimeMatch.keys), id: \.self){ date in
                    Section(header: Text(date), content:{
                        ForEach(Array(listTimeMatch[date]!)){match in
                            MatchRow(match: match)
                        }
                    })
                }
            }.navigationBarTitle("Match Week")
        }
    }
}

struct MatchWeekView_Previews: PreviewProvider {
    static var previews: some View {
        MatchWeekView()
    }
}
