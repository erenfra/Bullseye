//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 3/20/23.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottonView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    var body: some View {
        HStack {
            Button {
                game.restart()
            } label: {
                RoundedView(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button {
                leaderboardIsShowing = true
            } label: {
                RoundedFilledView(systemName: "list.dash")
            }
            .sheet(isPresented: $leaderboardIsShowing) {
                LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            }

        }
    }
}

struct BottonView: View {
    @Binding var game: Game
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack {
            Text(title.uppercased())
                .kerning(1.5)
                .font(.caption)
                .bold()
            .foregroundColor(Color("TextColor"))
            Text(text)
                .kerning(-0.2)
                .bold()
                .font(.title3)
                .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
                .foregroundColor(Color("TextColor"))
                .overlay(
                    RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                        .stroke(lineWidth: Constants.General.strokeWidth)
                        .foregroundColor(Color("ButtonStrokeColor"))
                )
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(opacity * 0.8), Color("RingColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }
        }
        
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
