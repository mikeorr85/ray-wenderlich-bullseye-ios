//
//  Shapes.swift
//  Bullseye
//
//  Created by Orr, Mike on 4/6/22.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShapes = true
  
  var body: some View {
    VStack {
      if !wideShapes {
        Circle()
          .strokeBorder(Color.blue, lineWidth: 20.0)
          .frame(width: 200, height: 100)
          .transition(.slide)
      }
      
      RoundedRectangle(cornerRadius: 20.0)
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      
      Capsule()
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      
      Ellipse()
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      
      Button(action: {
        withAnimation {
          wideShapes.toggle()
        }
      }) {
        Text("Animate!")
      }
    }
    .background(Color.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
