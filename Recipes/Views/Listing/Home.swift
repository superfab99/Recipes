//
//  Home.swift
//  Recepies
//
//  Created by Suyog Sawant on 06/07/22.
//

import SwiftUI

struct Home: View {
    @State private var recepies: [Recipes] = []
    @State private var isLoading = false
    @StateObject var recepieVm = RecepiesViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                List(recepieVm.recepies){ item in
                    ZStack{
                        NavigationLink(destination: RecipeDetail(recipe: item)) {
                            EmptyView()
                        }.opacity(0.0)
                            .buttonStyle(PlainButtonStyle())
                        
                        recepielistcell(item: item)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                            .background(Color(UIColor.systemBackground))
                            .onAppear(){
                                recepieVm.loadMoreRecepies(currentItem: item)
                            }
                        
                    }
                    .listRowSeparator(.hidden)
                }.listStyle(.plain)
                    .navigationTitle("Recepies ⭐️")
                
                if isLoading{
                    LoadingIndicator()
                }
            }.onAppear(){
                if recepieVm.recepies.count == 0{
                    recepieVm.getRecepies()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
