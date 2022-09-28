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
    
    
    var body: some View {
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
                            .frame(maxWidth: 300, maxHeight: 300)
                            .onTapGesture {
                                showInfo.toggle()
                            }
                            .sheet(isPresented: $showInfo) {
                                InfoCircuitView(info: race)
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
}

struct RaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailView(race: RaceDataModel.example)
            .previewLayout(.sizeThatFits)
    }
}


