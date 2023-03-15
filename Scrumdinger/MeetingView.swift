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
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MeetingView()
  }
}
