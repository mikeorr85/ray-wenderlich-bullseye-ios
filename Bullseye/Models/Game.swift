//
//  Game.swift
//  Bullseye
//
//  Created by Orr, Mike on 3/31/22.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 30, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 22, date: Date()))
    }
  }
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(self.target - sliderValue)
    let bonus: Int
    
    if difference == 0 {
      bonus = 100
    } else if (difference <= 2) {
      bonus = 50
    } else {
      bonus = 0
    }
    
    return 100 - difference + bonus
  }
  
  mutating func addToLeaderboard(point: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
    leaderboardEntries.sort { $0.score > $1.score }
  }
  
  mutating func startNewRound(points: Int) {
    round += 1
    score += points
    target = Int.random(in: 1...100)
    addToLeaderboard(point: points)
  }
  
  mutating func restart() {
    score = 0
    round = 1
  }
}
