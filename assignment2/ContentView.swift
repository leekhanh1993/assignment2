//
//  ContentView.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Text("Tab Content 2").tabItem { Text("Match Week")
                .font(.largeTitle) }.tag(1)
            TeamTableView().tabItem { Text("List Team") }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}


