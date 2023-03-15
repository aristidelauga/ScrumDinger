//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Aristide LAUGA on 15/03/2023.
//

import SwiftUI

struct DetailView: View {
  let scrum: DailyScrum
  
  @State private var isPresentingEditView = false
  
  var body: some View {
    List {
      Section(header: Text("Meeting Info")) {
        NavigationLink(destination: MeetingView()) {
          Label("Start Meeting", systemImage: "timer")
            .font(.headline)
            .foregroundColor(.accentColor)
            .accessibilityLabel("Start meeting")
        }
        HStack {
          Label("Length", systemImage: "clock")
            .accessibilityLabel("\(scrum.lengthInMinutes) minutes")
          Spacer()
          Text("\(scrum.lengthInMinutes) minutes")
        }
        .accessibilityElement(children:  .combine)
        HStack {
          Label("Theme", systemImage: "paintpalette")
          Spacer()
          Text(scrum.theme.name)
            .padding(4)
            .foregroundColor(scrum.theme.accentColor)
            .background(scrum.theme.mainColor)
            .cornerRadius(4)
        }
        .accessibilityElement(children: .combine)
      }
      Section(header: Text("Attendees")) {
        ForEach(scrum.attendees) { attendee in
          Label("\(attendee.name)", systemImage: "person")
        }
      }
    }
    .navigationBarTitle(scrum.title)
    .toolbar {
      Button {
        isPresentingEditView = true
      } label: {
        Text("Edit")
      }
    }
    .sheet(isPresented: $isPresentingEditView) {
      NavigationView {
        DetailEditView()
          .navigationTitle(scrum.title)
          .toolbar {
            ToolbarItem(placement: .cancellationAction) {
              Button {
                isPresentingEditView = false
              } label: {
                Text("Cancel")
              }
            }
            ToolbarItem(placement: .confirmationAction) {
              Button {
                isPresentingEditView = false
              } label: {
                Text("Done")
              }
            }
          }
      }
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      DetailView(scrum: DailyScrum.sampleData[0])
    }
  }
}
