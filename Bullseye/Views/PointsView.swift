//
//  PointsView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 4/4/23.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double

    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            Text("The slider's value is".uppercased())
                .kerning(2.0)
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
                .padding(.horizontal, 30)
            TargetView(value: roundedValue)
            Text("Your scored \(points) points\n 🎉🎉🎉")
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .lineSpacing(12)
            
            Button {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            } label: {
                Text("Start a New Round")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        Color.accentColor
                    )
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }

        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        PointsView(game: game, alertIsVisible: alertIsVisible, sliderValue: sliderValue)
        PointsView(game: game, alertIsVisible: alertIsVisible, sliderValue: sliderValue)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
