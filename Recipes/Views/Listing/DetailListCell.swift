//
//  DetailListCell.swift
//  Recepies
//
//  Created by Suyog Sawant on 05/07/22.
//

import SwiftUI
import CachedAsyncImage

struct DetailListCell: View {
    var item : RecipesDto
    var body: some View {
        HStack{
            CachedAsyncImage(
                url: URL(string: item.image == nil ? "" : item.image!),
                content: { image in
                    image.resizable()
                        .frame(width: 100,height: 100)
                        .cornerRadius(10)
                        .aspectRatio(contentMode: .fill)
                },
                placeholder: {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            )
            Spacer().frame(width: 10)
            VStack(alignment: .leading, spacing:5){
                Text(item.name!)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                HStack{
                    Image(systemName: "timer")
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text("ready to eat in \(String(item.readyInMinutes)) minutes")
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                }
            }
            Spacer()
        }
    }
}

struct DetailListCell_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hii")
    }
}
