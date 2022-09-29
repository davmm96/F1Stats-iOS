//
//  RankDriverItemView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct RankDriverItemView: View {
    
    var position: PositionDriverDataModel
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
            AsyncImage(url: URL(string: position.driver.image ?? "")){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(maxWidth: 40, maxHeight: 40)
                            .clipShape(Circle())
                            .shadow(radius: 10)
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
            }.background(Color("GrayTitle"))
            .opacity(0.8)
            .cornerRadius(14.0)
            .padding(4)
        }
    }
    
    var regularContent: some View {
        HStack{
            AsyncImage(url: URL(string: position.driver.image ?? "")){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(maxWidth: 70, maxHeight: 70)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(position.driver.name ?? "No name")
                    .font(Font.custom( "Formula1-Display-Bold", size: 20))
                    .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 0))
                
                Text(position.team.name ?? "No team")
                    .font(Font.custom( "Formula1-Display-Regular", size: 18))
                    .padding(.init(top: 0, leading: 10, bottom: 5, trailing: 0))
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
                        .font(Font.custom( "Formula1-Display-Regular", size: 16))
                        .padding(7)
                }
            }.background(Color("GrayTitle"))
            .opacity(0.8)
            .cornerRadius(14.0)
            .padding(10)
        }
    }
}

struct RankDriverItemView_Previews: PreviewProvider {
    static var previews: some View {
        RankDriverItemView(position: PositionDriverDataModel.example)
            .previewLayout(.sizeThatFits)
    }
}
