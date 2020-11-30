//
//  TeamDetailView.swift
//  assignment2
//
//  Created by Vo Tran Nhut Khanh on 29/11/20.
//

import SwiftUI

struct TeamDetailView: View {
    @Environment(\.openURL) var openURL
    var team: Team
    var body: some View {
        
        VStack {
            Image("\(team.nickname)stadium")
                .resizable()
                .scaledToFit()
            HStack(alignment: .center){
                Image(team.nickname)
                    .resizable()
                    .frame(width: 40, height: 50)
                VStack(alignment: .leading) {
                    Text(team.name)
                        .font(.title)
                        .fontWeight(.heavy)
                    Text(team.stadium.name)
                        .font(.subheadline)
                }.padding()
            }
            HStack(){
                HStack{
                    Text("Capacity:").bold()
                    Text("\(team.stadium.capacity)")
                }
                Spacer()
            }.padding()
            HStack(){
                HStack(){
                    Text("Address:").bold()
                        .baselineOffset(20.0)
                    Text("\(team.stadium.address)")
                }
                Spacer()
            }.padding()
            
            Button(action: {
                openURL(URL(string: "https://www.apple.com")!)
            }){
                HStack(alignment: .center){
                    Spacer()
                    Text("Official Website").bold()
                        .foregroundColor(.black)
                    Spacer()
                }.padding()
                .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .background(Color.gray)
            }.padding()
            Spacer()
        }
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(team: getListTeam()[0])
    }
}
