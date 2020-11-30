//
//  PrepareData.swift
//  assignment2
//
//  Created by Khanh, Vo Tran Nhut on 11/28/20.
//

import Foundation

//create a stuct for stadium informations
struct Stadium{
    var name: String
    var capacity: Int
    var address: String
    var pitchSize: String
    var built: String
}

//create a struct contact for each football team
struct Contact{
    var phone: String
    var officalWebsiteLink: String
}

//create an array contact for football teams

private let listContacts = [Contact(phone: "0843 208 1222", officalWebsiteLink: "www.fulhamfc.com"),
                            Contact(phone: "+44 (0) 20 7619 5003", officalWebsiteLink: " www.arsenal.com"),
                            Contact(phone: "+44 (0) 20 8768 6000", officalWebsiteLink: "www.cpfc.co.uk"),
                            Contact(phone: "+44 (0) 845 688 9448", officalWebsiteLink: "www.southamptonfc.com"),
                            Contact(phone: "+44 (0)151 263 2361", officalWebsiteLink: "www.liverpoolfc.com")]

//create an array team name
private let listNameTeam = ["Fulham", "Arsenal", "Crystal Palace", "Southampton", "Liverpool", "Leeds",
                            "West Ham", "Newcastle", "West Brom", "Leicester", "Spurs", "Everton", "Sheffield Utd", "Wolves",
                            "Brighton", "Chelsea", "Man Utd", "Man City", "Burnley", "Aston Villa"]


//create an array stadium info
private let listStadiumInfo = [Stadium(name: "Craven Cottage", capacity: 1900, address: "Stevenage Road, London, SW6 6HH", pitchSize: "100m x 65m", built: "1896"),
                               Stadium(name: "Emirates Stadium", capacity: 60260, address: "Highbury House, 75 Drayton Park, London, N5 1BU", pitchSize:"105m x 68m", built: "2006"),
                               Stadium(name: "Selhurst Park", capacity: 25486, address: "Selhurst Park Stadium, Holmesdale Road, London, SE25 6PU", pitchSize: "101m x 68m", built: "1924"),
                               Stadium(name: "St. Mary's Stadium", capacity: 32384, address: "St Mary's Stadium, Britannia Road, Southampton, SO14 5FP", pitchSize: "105m x 68m", built: "2001  "),
                               Stadium(name: "Anfield", capacity: 53394, address:   "Anfield, Anfield Road, Liverpool, L4 0TH",pitchSize: "101m x 68m", built:"1884"),
                               Stadium(name: "Elland Road", capacity: 37890, address: "Elland Road, Leeds, LS11 0ES"),
                               Stadium(name: "London Stadium", capacity: 60000, address: "London Stadium, Queen Elizabeth Olympic Park, London, E20 2ST"),
                               Stadium(name: "St. James' Park", capacity: 52305, address: "St. James' Park, Strawberry Place, Newcastle Upon Tyne, NE1 4ST"),
                               Stadium(name: "The Hawthorns", capacity: 26688, address: "The Hawthorns, West Bromwich, West Midlands, B71 4LF"),
                               Stadium(name: "King Power Stadium", capacity: 32273, address: "King Power Stadium, Filbert Way, Leicester, LE2 7FL"),
                               Stadium(name: "Tottenham Hotspur Stadium", capacity: 62062, address: "Lilywhite House, 782 High Road, Tottenham, London, N17 0BX"),
                               Stadium(name: "Goodison Park", capacity: 39221, address: "Goodison Park, Goodison Road, Liverpool, L4 4EL"),
                               Stadium(name: "Bramall Lane", capacity: 32050, address:  "Bramall Lane, Sheffield, South Yorkshire, S2 4SU"),
                               Stadium(name: "Molineux Stadium", capacity: 32050, address: "Molineux Stadium, Waterloo Rd, Wolverhampton, WV1 4QR"),
                               Stadium(name: "Amex Stadium", capacity: 30666, address: "American Express Community Stadium, Village Way, Brighton, BN1 9BL"),
                               Stadium(name: "Stamford Bridge", capacity: 40853, address: "Stamford Bridge, Fulham Road, London, SW6 1HS"),
                               Stadium(name: "Old Trafford", capacity: 74879, address: "Sir Matt Busby Way, Old Trafford, Manchester, M16 0RA"),
                               Stadium(name: "Etihad Stadium", capacity: 55017, address: "Etihad Stadium, Etihad Campus, Manchester, M11 3FF"),
                               Stadium(name: "Turf Moor", capacity: 21944, address: "Turf Moor, Harry Potts Way, Burnley, Lancashire, BB10 4BX"),
                               Stadium(name: "Villa Park", capacity: 42682, address: "Villa Park, Trinity Road, Birmingham, B6 6HE")
]



//create team instances based on list Name Team and add into listTeam
private var listTeam: [String:Team] = [:]



func getListTeam() -> [Team]{
    for index in listNameTeam.indices{
        listTeam[listNameTeam[index]] = Team(listNameTeam[index], listStadiumInfo[index])
    }
    //update match information to each team
    updateInfoToTeams(listMatch: getListMatch())
    
    //sort list team based on team points
    let sortedListTeam = listTeam.sorted(by: {(arg0, arg1) -> Bool in
        let (_, valueTeamA) = arg0
        let (_, valueTeamB) = arg1
        return valueTeamA.numPoints > valueTeamB.numPoints
    })
    
    //create a new array to store Teams
    var listTeams: [Team] = []
    for team in sortedListTeam{
        listTeams.append(team.value)
    }
    return listTeams
}
func getListMatch() -> [Match]{
    for index in listNameTeam.indices{
        listTeam[listNameTeam[index]] = Team(listNameTeam[index], listStadiumInfo[index])
    }
    //Read File csvfile.csv
    var matchInfoList = readFile(nameURL: "csvfile", typeFile: "csv")!
    
    //Create and return a list match
    return createInfoToMatchList(matchInfoList: &matchInfoList, listTeam: listTeam)
}
