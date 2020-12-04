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
        GeometryReader{ geo in
            ScrollView{
                VStack {
                    Image("\(team.teamBasicInfo.nickName)stadium")
                        .resizable()
                        .frame(width: geo.size.width, height: 200)
                    HStack(alignment: .center){
                        Image(team.teamBasicInfo.nickName)
                            .resizable()
                            .frame(width: 70, height: 75)
                            .padding()
                        VStack(alignment: .leading) {
                            Text(team.teamBasicInfo.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text(team.teamBasicInfo.stadiumInfo.name)
                                .font(.title3)
                        }.padding()
                    }
                    HStack(){
                        HStack{
                            Text("Capacity:").bold()
                                .frame(width: 90, height: nil, alignment: .leading)
                            Text("\(team.teamBasicInfo.stadiumInfo.capacity)")
                        }
                        Spacer()
                    }.padding()
                    
                    HStack(){
                        HStack{
                            Text("Built:").bold()
                                .frame(width: 90, height: nil, alignment: .leading)
                            Text("\(team.teamBasicInfo.stadiumInfo.built)")
                        }
                        Spacer()
                    }.padding()
                    HStack(){
                        HStack{
                            Text("Pitch size:").bold()
                                .frame(width: 90, height: nil, alignment: .leading)
                            Text("\(team.teamBasicInfo.stadiumInfo.pitchSize)")
                        }
                        Spacer()
                    }.padding()
                    HStack(){
                        HStack(){
                            VStack {
                                Text("Address:").bold()
                                    .baselineOffset(20.0)
                                    .frame(width: 90, height: nil, alignment: .leading)
                                Spacer()
                            }
                            Text("\(team.teamBasicInfo.stadiumInfo.address)")
                        }
                        Spacer()
                    }.padding()
                    HStack(){
                        HStack(){
                            Text("Phone:").bold().frame(width: 90, height: nil, alignment: .leading)
                            Text("\(team.teamBasicInfo.contact.phone)")
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
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(team: getListTeam()[11])
    }
}
