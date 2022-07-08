//
//  ContentView.swift
//  Recepies
//
//  Created by Suyog Sawant on 04/07/22.
//

import SwiftUI
import CachedAsyncImage


struct ContentView: View {    
    init(){
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        navBarAppearance.backgroundColor = UIColor(red: 0.26, green: 0.57, blue: 0.49, alpha: 3.00)
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = UIColor.systemBackground
        
    }
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                    Text("Home")
                }
            
            Bookmarks()
                .tabItem {
                    Label("favourites", systemImage: "star")
                    Text("favourites")
                }
        }.onAppear(){
            print(NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).last! as String)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
