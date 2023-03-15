//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Aristide LAUGA on 15/03/2023.
//

import SwiftUI

struct ScrumsView: View {
  let scrums: [DailyScrum]
  var body: some View {
    List {
      ForEach(scrums) { scrum in
        NavigationLink(destination: DetailView(scrum: scrum)) {
          CardView(scrum: scrum)
        }
        .listRowBackground(scrum.theme.mainColor)
      }
    }
    .navigationBarTitle("Daily Scrums")
    .toolbar {
      Button {
      
      } label: {
        Image(systemName: "plus")
      }
      .accessibilityLabel("New Scrum")
    }
  }
}

struct ScrumsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ScrumsView(scrums: DailyScrum.sampleData)
    }
  }
}