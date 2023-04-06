//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 4/5/23.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack(spacing: 10) {
                LeaderboardHeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices, id: \.self) { index in
                            let leaderboardEntry = game.leaderboardEntries[index]
                            RowView(index: index+1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct LeaderboardHeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    var body: some View {
        ZStack{
            HStack {
                BigBoldText(text: "Leaderboard")
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    Spacer()
                }
            }
            HStack{
                Spacer()
                Button {
                    leaderboardIsShowing = false
                } label: {
                    RoundedFilledView(systemName: "xmark")
                }
            }
        }.padding([.horizontal, .top])
    }
}



struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            DateText(date: Date())
                .frame(width: Constants.Leaderboard.dateColumnWidth)
            
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct BigBoldText: View {
    var text: String

    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .fontWeight(.black)
            .kerning(2)
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelView: View {
    var body: some View {
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            Text("Score".uppercased())
                .font(.subheadline)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            Text("Date".uppercased())
                .font(.subheadline)
                .frame(width: Constants.Leaderboard.dateColumnWidth)
         
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
