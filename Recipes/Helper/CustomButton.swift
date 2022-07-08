//
//  CustomButton.swift
//  Recepies
//
//  Created by Suyog Sawant on 05/07/22.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      HStack {
        Spacer()
        configuration.label.foregroundColor(.white)
        Spacer()
      }
      .padding()
      .background(Color(hex: "#43927d").cornerRadius(8))
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }

