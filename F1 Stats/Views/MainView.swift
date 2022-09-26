//
//  MainView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import SwiftUI

struct MainView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Formula1-Display-Bold", size: 40)!]
        
        for family in UIFont.familyNames {
                 print(family)

                 for names in UIFont.fontNames(forFamilyName: family){
                 print("== \(names)")
                 }
            }
    }
    
    var body: some View {
        TabView{
            RankView()
                    .tabItem {
                        Label("Rank", systemImage: "trophy")
                    }
            RacesView()
                .tabItem {
                    Label("Races", systemImage: "flag.checkered")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(APIService())
    }
}
