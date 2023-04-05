//
//  ContentView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 3/14/23.
//

import SwiftUI

struct MainView: View {
    @State private var game = Game()
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack(spacing: 10) {
                
                HeaderView()
                TargetView(value: game.target)
                if !alertIsVisible {
                    HStack {
                        Text("1")
                            .frame(width: 35)
                        Slider(value: $sliderValue, in: 1.0...100.0)
                            .padding(.horizontal)
                        Text("100")
                            .frame(width: 35)
                    }.font(.headline)
                    .padding()
                    .zIndex(1)
                    .transition(.scale)
                }
                if alertIsVisible {
                    PointsView(game: $game, alertIsVisible: $alertIsVisible, sliderValue: $sliderValue)
                        .transition(.scale)
                } else {
                    Button {
                        withAnimation {
                            alertIsVisible = true
                        }
                    } label: {
                        Text("Hit me!".uppercased())
                    }
                    .transition(.scale)
                    .padding(20.0)
                    .background(
                        ZStack {
                            Color("ButtonColor")
                            LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
                        }
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                            .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(Constants.General.roundRectCornerRadius)
                    .bold()
                    .font(.title3)
                }
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
