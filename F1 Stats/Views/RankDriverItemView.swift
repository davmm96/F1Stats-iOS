//
//  RankDriverItemView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct RankDriverItemView: View {
    
    var position: PositionDriverDataModel
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: position.driver.image ?? "")){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(maxWidth: 40, maxHeight: 40)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(position.driver.name ?? "No name")
                    .font(Font.custom( "Formula1-Display-Bold", size: 15))
                    .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 0))
                
                Text(position.team.name ?? "No team")
                    .font(Font.custom( "Formula1-Display-Regular", size: 12))
                    .padding(.init(top: 0, leading: 10, bottom: 5, trailing: 0))
            }
            
            Spacer()
            
            Text(position.points.flatMap(String.init) ?? "0")
                .font(Font.custom( "Formula1-Display-Regular", size: 15))
        }
    }
}
