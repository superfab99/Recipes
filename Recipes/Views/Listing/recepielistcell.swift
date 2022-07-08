//
//  recepielistcell.swift
//  Recepies
//
//  Created by Suyog Sawant on 05/07/22.
//

import SwiftUI
import CachedAsyncImage

struct recepielistcell: View {
    var item : Recipes
    var body: some View {
        ZStack{
            CachedAsyncImage(
                url: URL(string: item.image == nil ? "" : item.image!),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                },
                placeholder: {
                   Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            ).cornerRadius(5)
            VStack{
                Spacer()
                VStack(alignment: .leading,spacing: 5){
                    Text(item.title)
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                    HStack(spacing:10){
                        HStack(alignment: .center){
                            Image(systemName: "timer")
                            Text("\(String(item.readyInMinutes)) Min")
                                .fontWeight(.bold)
                                .font(.system(size: 12))
                        }
                        Text(item.vegetarian ? "Vegetarian" : "Non Vegetarian")
                            .fontWeight(.bold)
                            .font(.system(size: 12))
                        
                        Text(item.veryHealthy ? "Very healthy" : "")
                            .fontWeight(.bold)
                            .font(.system(size: 12))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity,alignment:.leading)
                .padding()
                .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 16.0))
                Spacer().frame( height: 10)
            }
        }
    }
}

struct recepielistcell_Previews: PreviewProvider {
    static var previews: some View {
        Text("hello")
    }
}
