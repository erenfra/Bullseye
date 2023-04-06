//
//  RoundedView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 3/16/23.
//

import SwiftUI

struct RoundedView: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct ScoreText: View {
    var score: Int
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View {
    var date: Date
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
    }
}

struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            RoundedView(systemName: "list.dash")
            RoundedTextView(text: "1")
            ScoreText(score: 999)
            DateText(date: Date())
        }.padding()
    }
}
