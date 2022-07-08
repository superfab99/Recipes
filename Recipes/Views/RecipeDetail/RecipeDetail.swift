//
//  RecipeDetail.swift
//  Recepies
//
//  Created by Suyog Sawant on 05/07/22.
//

import SwiftUI
import CachedAsyncImage

struct RecipeDetail: View {
    @State var selection: Int? = nil
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var recepieVm = RecepiesViewModel()
    @State var recipe : Recipes?
    @State var isFavourite : Bool = false
    var recipeId : Int?
    
    var body: some View {
        ScrollView{
        VStack{
            if let safeRecipe = recipe{
                Group{
                    CachedAsyncImage(
                              url: URL(string: recipe!.image == nil ? "" : recipe!.image!),
                              content: { image in
                                  image.resizable()
                                      .frame(height: 220)
                                      .cornerRadius(10)
                                      .aspectRatio(contentMode: .fill)
                              },
                              placeholder: {
                                 Image("placeholder")
                                      .resizable()
                                      .aspectRatio(contentMode: .fit)
                              }
                          )
                    
                    Spacer().frame(height: 20)
                    
                    HStack{
                    Text(recipe!.title)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        Spacer()
                        Image(systemName: isFavourite ? "star.fill" : "star")
                            .frame(width: 30, height: 30)
                            .onTapGesture {
                                let addRecipe = RecipesDto(context: viewContext)
                                addRecipe.readyInMinutes = Int32(recipe!.readyInMinutes)
                                addRecipe.date = Date()
                                addRecipe.image = recipe!.image
                                addRecipe.isVeg = recipe!.vegetarian
                                addRecipe.name = recipe!.title
                                addRecipe.id = Int32(recipe!.id)
                                
                                do{
                                    try viewContext.save()
                                    print("Data Saved")
                                }
                                catch{
                                    print(error)
                                    print("Error while saving data")
                                }
                            }
                    }
                    
                    HStack(alignment: .center, spacing: 35){
                        VStack{
                            Text(String(recipe!.aggregateLikes))
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .foregroundColor(Color(hex: "#3e7d6c"))
                            Text("Likes")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "#cccccc"))
                        }
                        
                        VStack{
                            Text(String(recipe!.servings))
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .foregroundColor(Color(hex: "#3e7d6c"))
                            Text("Servings")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "#cccccc"))
                        }
                        
                        VStack{
                            Text(String(recipe!.pricePerServing))
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .foregroundColor(Color(hex: "#3e7d6c"))
                            Text("Price/Serving")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "#cccccc"))
                        }
                        
                        VStack{
                            Text(String(recipe!.readyInMinutes))
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .foregroundColor(Color(hex: "#3e7d6c"))
                            Text("Minutes")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "#cccccc"))
                        }
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .border(Color(hex: "#e8e8e8"), width: 2)
                    .cornerRadius(5)
                    
                    Spacer().frame(height: 15)
                    
                    HStack{
                        ForEach(recipe!.dishTypes.prefix(4),id: \.self) { item in
                            Chip(titleKey: item)
                        }
                    }
                    
                    Spacer().frame(height: 15)
                    
                    HStack{
                        Text("Ingredients")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "#444444"))
                        Spacer()
                        Text("\(recipe!.extendedIngredients.count) Items")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "#cccccc"))
                    }
                    Spacer().frame(height: 10)
                    
                    List(recipe!.extendedIngredients){ item in
                        HStack{
                            Text(item.name)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#444444"))
                            Spacer()
                            Text("\(String(item.amount)) \(item.unit)")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#444444"))
                        }.listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                    }.listStyle(.plain)
                        .frame(height: 220)
                }
                
                NavigationLink(destination: RecipeSteps(recipe: recipe!), tag: 1, selection: $selection) {
                                    Button("Lets Cook !!!") {
                                        self.selection = 1
                                    }
                                }.buttonStyle(CustomButton())
            }
    
        }
        .navigationTitle("Recipe Details")
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }.onAppear(){
            if let recpId = recipeId{
                recepieVm.getRecepieById(id: recpId) { rec in
                    self.recipe = rec
                    isFavourite = true
                }
            }
            
        }
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hii")
    }
}
