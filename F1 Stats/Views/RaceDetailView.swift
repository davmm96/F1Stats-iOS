//
//  RaceDetailView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct RaceDetailView: View {
    var race: RaceDataModel
    @State var showInfo = false
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var horizontallyConstrained: Bool {
        return horizontalSizeClass == .compact
    }
    
    var body: some View {
        Group {
            if horizontallyConstrained {
                compactContent
            } else {
                regularContent
            }
        }
    }
    
    var compactContent: some View {
        ScrollView{
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.9)
                .overlay(TitleOverlay(title: "\(race.competition.location.country ?? "Spain") \(race.season.flatMap(String.init) ?? "2022")"), alignment: .bottom)
            
            VStack(){
                
                VStack{
                    Text("\(race.competition.name ?? "No circuit")")
                        .font(Font.custom( "Formula1-Display-Bold", size: 23))
                        .padding(.bottom, 4)
                    
                    Text("\(race.competition.location.city ?? "No circuit"), \(race.competition.location.country ?? "No circuit")")
                        .font(Font.custom( "Formula1-Display-Regular", size: 15))
                }.padding(.top, 30)

                HStack{
                    Text("Circuit: ")
                        .font(Font.custom( "Formula1-Display-Bold", size: 18))
                    Text("\(race.circuit.name ?? "No circuit")")
                        .font(Font.custom( "Formula1-Display-Regular", size: 16))
                }.padding(.top, 20)
                
                HStack{
                    Text("Status: ")
                        .font(Font.custom( "Formula1-Display-Bold", size: 18))
                    
                    if(race.status == StatusRace.completed.rawValue){
                        Text("\(race.status ?? "No status") ✅")
                            .font(Font.custom( "Formula1-Display-Regular", size: 16))
                    }
                    else if (race.status == StatusRace.scheduled.rawValue)
                    {
                        Text("\(race.status ?? "No status") 🗓")
                            .font(Font.custom( "Formula1-Display-Regular", size: 16))
                    }
                    else
                    {
                        Text("\(race.status ?? "No status") ❌")
                            .font(Font.custom( "Formula1-Display-Regular", size: 16))
                    }
                }.padding(.top, 20)
                
                if(race.status == "Completed")
                {
                    HStack{
                        Text("Fastest lap: ")
                            .font(Font.custom( "Formula1-Display-Bold", size: 18))
                        
                        Text("\(race.fastest_lap.time ?? "No time") ⏱")
                                .font(Font.custom( "Formula1-Display-Regular", size: 16))
                                .foregroundColor(.red)
                    }.padding(.top, 20)
                }
                
            }
            
            AsyncImage(url: URL(string: race.circuit.image ?? "")){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                        .padding(.top, 60)
                    case .success(let image):
                        image.resizable()
                            .padding(.top, 60)
                            .scaledToFill()
                            .clipped()
                            .frame(maxWidth: 200, maxHeight: 200)
                            .onTapGesture {
                                showInfo.toggle()
                            }
                            .sheet(isPresented: $showInfo) {
                                InfoCircuitView(distance: race.distance ?? "0 Kms", laps: race.laps.total, image: image)
                            }
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                }
            }
            
            Text("Tap to see more")
                .font(Font.custom( "Formula1-Display-Regular", size: 11))
        }.ignoresSafeArea()
    }
    
    var regularContent: some View {
        ScrollView{
            VStack(alignment: .leading){
                ZStack {
                    Text("\(race.competition.location.country ?? "Spain") \(race.season.flatMap(String.init) ?? "2022")")
                        .font(Font.custom( "Formula1-Display-Bold", size: 50))
                        .padding(8)
                        .foregroundColor(.red)
                }.background(Color.black)
                .opacity(0.8)
                .cornerRadius(10.0)
                
                HStack{
                    VStack{
                        Text("\(race.competition.name ?? "No circuit")")
                            .font(Font.custom( "Formula1-Display-Bold", size: 23))
                            .padding(.bottom, 4)
                        
                        Text("\(race.competition.location.city ?? "No circuit"), \(race.competition.location.country ?? "No circuit")")
                            .font(Font.custom( "Formula1-Display-Regular", size: 15))
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Circuit")
                            .font(Font.custom( "Formula1-Display-Bold", size: 23))
                            .padding(.bottom, 4)

                        Text("\(race.circuit.name ?? "No circuit")")
                            .font(Font.custom( "Formula1-Display-Regular", size: 15))
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Status")
                            .font(Font.custom( "Formula1-Display-Bold", size: 23))
                            .padding(.bottom, 4)
                        
                        if(race.status == StatusRace.completed.rawValue){
                            Text("\(race.status ?? "No status") ✅")
                                .font(Font.custom( "Formula1-Display-Regular", size: 15))
                        }
                        else if (race.status == StatusRace.scheduled.rawValue)
                        {
                            Text("\(race.status ?? "No status") 🗓")
                                .font(Font.custom( "Formula1-Display-Regular", size: 15))
                        }
                        else
                        {
                            Text("\(race.status ?? "No status") ❌")
                                .font(Font.custom( "Formula1-Display-Regular", size: 15))
                        }
                    }
                    Spacer()
                    
                    if(race.status == "Completed")
                    {
                        VStack{
                            Text("Fastest lap")
                                .font(Font.custom( "Formula1-Display-Bold", size: 23))
                                .padding(.bottom, 4)
                            
                            Text("\(race.fastest_lap.time ?? "No time") ⏱")
                                .font(Font.custom( "Formula1-Display-Regular", size: 15))
                                .foregroundColor(.red)
                        }
                        Spacer()
                    }
                    
                
                }.padding()
                
            }
            
            AsyncImage(url: URL(string: race.circuit.image ?? "")){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                        .padding(.top, 60)
                    case .success(let image):
                        image.resizable()
                            .padding(.top, 60)
                            .scaledToFill()
                            .frame(maxWidth: 500, maxHeight: 500)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                }
            }
            
            HStack{
                Text("Distance:")
                    .font(Font.custom( "Formula1-Display-Bold", size: 18))
                Text(race.distance ?? "No distance data")
                    .font(Font.custom( "Formula1-Display-Regular", size: 18))
            }.padding(.top, 30)
            
            HStack{
                Text("Laps:")
                    .font(Font.custom( "Formula1-Display-Bold", size: 18))
                Text("\(Int(race.laps.total))")
                    .font(Font.custom( "Formula1-Display-Regular", size: 18))
            }.padding(.top, 30)
        }
    }
}

struct RaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailView(race: RaceDataModel.example)
            .previewLayout(.sizeThatFits)
    }
}


