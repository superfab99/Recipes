//
//  Chip.swift
//  Recepies
//
//  Created by Suyog Sawant on 05/07/22.
//

import SwiftUI

struct Chip: View {//pass system image
        let titleKey: String //text or localisation value
        var body: some View {
            HStack {
                Text(titleKey).font(.system(size: 12)).fontWeight(.bold).lineLimit(1).textCase(.uppercase)
            }.padding(.all, 10)
            .foregroundColor(Color(hex: "43927d"))
            .background(Color(hex: "#e8efe5")) //different UI for selected and not selected view
            .cornerRadius(10)  //rounded Corner
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#e8efe5"), lineWidth: 1.5)
            
            )
        }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(titleKey: "Breakfast")
    }
}
