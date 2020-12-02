//
//  MatchWeekView.swift
//  assignment2
//
//  Created by Vo Tran Nhut Khanh on 1/12/20.
//

import SwiftUI

struct MatchWeekView: View {
    let listMatch = getListMatch()
    var body: some View {
        NavigationView {
            List{
                ForEach(listMatch){match in
                    MatchRow(match: match)
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
