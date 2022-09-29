//
//  RankTeamItemView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct RankTeamItemView: View {
    var position: PositionTeamDataModel
    
    var body: some View {
        
        HStack{
            AsyncImage(url: URL(string: position.team.logo ?? "")){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(maxWidth: 30, maxHeight: 30)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(position.team.name ?? "No name")
                    .font(Font.custom( "Formula1-Display-Bold", size: 13))
                    .padding(.init(top: 5, leading: 12, bottom: 5, trailing: 0))
            }
            
            Spacer()
            
            VStack {
                if(position.position == 1)
                {
                    Text("\(Int(position.points ?? 0)) PTS" )
                        .font(Font.custom( "Formula1-Display-Bold", size: 12))
                        .padding(8)
                }
                else
                {
                    Text("\(Int(position.points ?? 0)) PTS" )
                        .font(Font.custom( "Formula1-Display-Regular", size: 11))
                        .padding(7)
                }
            }.background(Color(white: 0.9))
            .opacity(0.8)
            .cornerRadius(14.0)
            .padding(4)
        }
    }
}

struct RankTeamItemView_Previews: PreviewProvider {
    static var previews: some View {
        RankTeamItemView(position: PositionTeamDataModel.example)
            .previewLayout(.sizeThatFits)
    }
}

