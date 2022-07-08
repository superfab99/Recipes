//
//  RecipeSteps.swift
//  Recepies
//
//  Created by Suyog Sawant on 06/07/22.
//

import SwiftUI
import CachedAsyncImage

struct RecipeSteps: View {
    var recipe: Recipes
    var body: some View {
        VStack{
            CachedAsyncImage(
                      url: URL(string: recipe.image == nil ? "" : recipe.image!),
                      content: { image in
                          image.resizable()
                              .frame(height: 220)
                              .cornerRadius(10)
                              .aspectRatio(contentMode: .fill)
                      },
                      placeholder: {
                         Image("placeholder")
                              .resizable()
                              .frame(height: 220)
                              .aspectRatio(contentMode: .fit)
                      }
                  )
            
            Spacer().frame(height: 20)
            
            Text("Preparation Steps")
                .fontWeight(.bold)
                .font(.headline)
            
            Spacer().frame(height: 20)
            if let safeSteps = recipe.analyzedInstructions.first{
                List(recipe.analyzedInstructions.first!.steps){ item in
                    HStack{
                        Image(systemName: "\(item.number).square.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(hex: "#3e7d6c"))
                        Spacer().frame(width: 15)
                        Text(item.step)
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                    }.listRowSeparator(.hidden)
                }.listStyle(.plain)
            }else{
                Text("Oops we did not found preparation steps for this recipe")
            }
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle(recipe.title)
    }
}

struct RecipeSteps_Previews: PreviewProvider {
    static var previews: some View {
            Text("Hii")
    }
}
