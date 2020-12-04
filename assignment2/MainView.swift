//
//  ContentView.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            MatchWeekView().tabItem { Text("Match Week") }.tag(1)
            TeamTableView().tabItem { Text("List Team") }.tag(2)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            MainView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}


