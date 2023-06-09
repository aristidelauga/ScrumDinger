//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Aristide LAUGA on 15/03/2023.
//

import SwiftUI
import AVFoundation


struct MeetingView: View {
  @StateObject var scrumTimer = ScrumTimer()
  @Binding var scrum: DailyScrum
  
  private var player: AVPlayer { AVPlayer.sharedDingPlayer }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 16.0)
        .fill(scrum.theme.mainColor)
      VStack {
        MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
        Circle()
          .strokeBorder(lineWidth: 24)
        MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
      }
    }
    .padding()
    .foregroundColor(scrum.theme.accentColor)
    .onAppear {
      scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
      scrumTimer.startScrum()
      scrumTimer.speakerChangedAction = {
        player.seek(to: .zero)
        player.play()
      }
    }
    .onDisappear {
      scrumTimer.stopScrum()
    }
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
  }
}
