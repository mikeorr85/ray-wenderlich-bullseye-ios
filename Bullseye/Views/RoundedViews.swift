//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Orr, Mike on 4/6/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .strokeBorder(
            Color("ButtonStrokeColor"),
            lineWidth: 2.0
          )
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundedRectTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-0.2)
      .bold()
      .font(.title3)
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewWidth)
      .foregroundColor(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWidth)
          .foregroundColor(Color("ButtonStrokeColor"))
      )
  }
}

struct RoundedTextView: View {
  let text: String
  
  var body: some View {
    Text(text)
      .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .strokeBorder(
            Color("LeaderboardRowColor"),
            lineWidth: 2.0
          )
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
      RoundedRectTextView(text: "100")
      RoundedTextView(text: "1")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
