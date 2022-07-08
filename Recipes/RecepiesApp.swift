//
//  RecepiesApp.swift
//  Recepies
//
//  Created by Suyog Sawant on 04/07/22.
//

import SwiftUI

@main
struct RecepiesApp: App {
    @StateObject private var manager: DataManager = DataManager()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
