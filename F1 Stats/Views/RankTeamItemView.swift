//
//  RankTeamItemView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct RankTeamItemView: View {
    var position: PositionTeamDataModel
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
    
    var regularContent: some View {
        
        HStack{
            AsyncImage(url: URL(string: position.team.logo ?? "")){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(maxWidth: 70, maxHeight: 70)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(position.team.name ?? "No name")
                    .font(Font.custom( "Formula1-Display-Bold", size: 20))
                    .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 0))
            }
            
            Spacer()
            
            VStack {
                if(position.position == 1)
                {
                    Text("\(Int(position.points ?? 0)) PTS" )
                        .font(Font.custom( "Formula1-Display-Bold", size: 18))
                        .padding(8)
                }
                else
                {
                    Text("\(Int(position.points ?? 0)) PTS" )
                        .font(Font.custom( "Formula1-Display-Bold", size: 16))
                        .padding(7)
                }
            }.background(Color("GrayTitle"))
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

