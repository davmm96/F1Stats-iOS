//
//  DriverDetailView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 28/9/22.
//

import SwiftUI

struct DriverDetailView: View {
    
    @StateObject var apiService: APIService = APIService()
    
    var idDriver: Int
    
    var body: some View {
        ScrollView{
            
            if(!apiService.driver.isEmpty){
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text(apiService.driver[0].name ?? "Default name")
                                .font(Font.custom( "Formula1-Display-Bold", size: 23))
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                            
                            HStack
                            {
                                Text(apiService.driver[0].number.flatMap(String.init) ?? "Nº")
                                    .font(Font.custom( "Formula1-Display-Bold", size: 16))
                                    .foregroundColor(.white)
                                
                                Text(apiService.driver[0].country?.name ?? "Default country")
                                    .font(Font.custom( "Formula1-Display-Regular", size: 16))
                                    .foregroundColor(.white)
                            }
                        }.padding(.leading, 20)
                        Spacer()
                        AsyncImage(url: URL(string: apiService.driver[0].image ?? "")){ phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .frame(maxWidth: 120, maxHeight: 120)
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                EmptyView()
                            }
                        }
                        Spacer()
                    }.padding(.top, 100)
                        .background(LinearGradient(gradient: Gradient(colors: [.white, Color("GradientColor"),Color("GradientColor")]), startPoint: .bottomTrailing, endPoint: .topLeading))
                }
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("World Championships")
                            .font(Font.custom( "Formula1-Display-Regular", size: 12))
                            .foregroundColor(Color(white: 0.4))
                            .padding(.bottom, 2)
                        
                        Text(apiService.driver[0].world_championships.flatMap(String.init) ?? "0")
                            .font(Font.custom( "Formula1-Display-Bold", size: 60))
                    }.padding(.bottom, 30)
                    
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Podiums")
                                .font(Font.custom( "Formula1-Display-Regular", size: 12))
                                .foregroundColor(Color(white: 0.4))
                                .padding(.bottom, 4)
                            
                            Text(apiService.driver[0].podiums.flatMap(String.init) ?? "0")
                                .font(Font.custom( "Formula1-Display-Bold", size: 35))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            Text("Wins")
                                .font(Font.custom( "Formula1-Display-Regular", size: 12))
                                .foregroundColor(Color(white: 0.4))
                                .padding(.bottom, 4)
                            
                            if(apiService.driver[0].highest_race_finish?.position == 1){
                                Text(apiService.driver[0].highest_race_finish?.number.flatMap(String.init) ?? "0")
                                    .font(Font.custom( "Formula1-Display-Bold", size: 35))
                            }
                            else
                            {
                                Text("0")
                                    .font(Font.custom( "Formula1-Display-Bold", size: 35))
                            }
                        }
                        
                        Spacer()
                    }.padding(.bottom, 20)
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Races")
                                .font(Font.custom( "Formula1-Display-Regular", size: 12))
                                .foregroundColor(Color(white: 0.4))
                                .padding(.bottom, 4)
                            
                            Text(apiService.driver[0].grands_prix_entered.flatMap(String.init) ?? "0")
                                .font(Font.custom( "Formula1-Display-Bold", size: 35))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            Text("Total points")
                                .font(Font.custom( "Formula1-Display-Regular", size: 12))
                                .foregroundColor(Color(white: 0.4))
                                .padding(.bottom, 4)
                            
                            Text(apiService.driver[0].career_points ?? "0")
                                .font(Font.custom( "Formula1-Display-Bold", size: 35))
                        }
                        
                        Spacer()
                    }
                 }.padding()
            }
            }.onAppear{
                apiService.getDriver(id: idDriver)
            }
            .ignoresSafeArea()
        
    }
}

struct DriverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailView(idDriver: 4)
    }
}
