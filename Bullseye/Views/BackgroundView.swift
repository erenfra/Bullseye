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
            Color("BackgroundColor")
                .ignoresSafeArea()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    var body: some View {
        HStack {
            Button {
                game.restart()
            } label: {
                RoundedView(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedFilledView(systemName: "list.dash")
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
                .frame(width: 68, height: 56)
                .foregroundColor(Color("TextColor"))
                .overlay(
                    RoundedRectangle(cornerRadius: 21)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color("ButtonStrokeColor"))
                )
        }
    }
    
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
