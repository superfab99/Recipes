//
//  DataManager.swift
//  Recepies
//
//  Created by Suyog Sawant on 06/07/22.
//

import CoreData
import Foundation

class DataManager: NSObject, ObservableObject {
    
    @Published var recipes: [Recipes] = [Recipes]()
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "Recepies")
    override init() {
            super.init()
            container.loadPersistentStores { _, _ in }
    }
}
