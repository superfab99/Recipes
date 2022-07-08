//
//  SplashView.swift
//  Recepies
//
//  Created by Suyog Sawant on 06/07/22.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            ContentView()
        }
        else{
            ZStack{
                Color(hex: "3e7d6c")
                VStack{
                    Image(systemName: "flame")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                    
                    Spacer().frame(height: 20)
                    
                    Text("Recipe Finder")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                    Spacer().frame(height: 10)
                    
                    Text("Find New Recipes Everyday!!!")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }.scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
            }.ignoresSafeArea()
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
