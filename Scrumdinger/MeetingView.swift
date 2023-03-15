//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Aristide LAUGA on 15/03/2023.
//

import SwiftUI

struct MeetingView: View {
  var body: some View {
    VStack {
      ProgressView(value: 5, total: 15)
      HStack {
        VStack(alignment: .leading) {
          Text("Seconds elapsed")
            .font(.caption)
          Label("300", systemImage: "hourglass.bottomhalf.fill")
        }
        Spacer()
        VStack(alignment: .trailing) {
          Text("Seconds remaining")
            .font(.caption)
          Label("600", systemImage: "hourglass.bottomhalf.fill")
        }
      }
      .accessibilityElement(children: .ignore)
      .accessibilityLabel("Time remaining")
      .accessibilityLabel("10 minutes")
      Circle()
        .strokeBorder(lineWidth: 24)
      HStack {
        Text("Speaker 1 on 3")
        Spacer()
        Button {
          
        } label: {
          Image(systemName: "forward.fill")
        }
        .accessibilityLabel("Next speaker")
      }
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MeetingView()
  }
}
