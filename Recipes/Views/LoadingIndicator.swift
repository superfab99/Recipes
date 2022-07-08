//
//  LoadingIndicator.swift
//  Recepies
//
//  Created by Suyog Sawant on 05/07/22.
//

import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(3)
        }
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
