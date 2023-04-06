//
//  Game.swift
//  Bullseye
//
//  Created by Renato Oliveira Fraga on 3/14/23.
//

import Foundation

struct Game {
    
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - self.target)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int) {
        //addToLeaderboard(score: points)
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        addToLeaderboard(score: score)
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { entry1, entry2 in
            entry1.score > entry2.score
        }
    }
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
