//
//  Bookmarks.swift
//  Recepies
//
//  Created by Suyog Sawant on 06/07/22.
//

import SwiftUI

struct Bookmarks: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: RecipesDto.entity(), sortDescriptors: [])
        private var recipes: FetchedResults<RecipesDto>
    
    var body: some View {
        NavigationView{
            ZStack{
                if(recipes.count > 0 ){
                    List(recipes){ item in
                        ZStack{
                            NavigationLink(destination: RecipeDetail(recipe: nil,recipeId: Int(item.id))) {
                                EmptyView()
                            }.opacity(0.0)
                                .buttonStyle(PlainButtonStyle())
                            
                            DetailListCell(item: item)
                        }.listRowSeparator(.hidden)
                    }.listStyle(.plain)
                }
                else{
                    VStack{
                        Image(systemName: "star")
                            .font(.system(size: 80))
                            .foregroundColor(Color(hex: "3e7d6c"))
                        
                        Spacer().frame(height: 20)
                        
                        Text("Nothing !!!")
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                            .foregroundColor(Color(hex: "3e7d6c"))
                        
                        Spacer().frame(height: 10)
                        
                        Text("No recipes are marked as favourites")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .foregroundColor(Color(hex: "3e7d6c"))
                    }
                }
            }.navigationTitle("Favourites")
        }
    }
}

struct Bookmarks_Previews: PreviewProvider {
    static var previews: some View {
        Bookmarks()
    }
}
