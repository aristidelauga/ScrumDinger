//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Aristide LAUGA on 15/03/2023.
//

import SwiftUI

struct DetailView: View {
  @Binding var scrum: DailyScrum
  
  @State private var data = DailyScrum.Data()
  @State private var isPresentingEditView = false
  
  var body: some View {
    List {
      Section(header: Text("Meeting Info")) {
        NavigationLink(destination: MeetingView(scrum: $scrum)) {
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
        data = scrum.data
      } label: {
        Text("Edit")
      }
    }
    .sheet(isPresented: $isPresentingEditView) {
      NavigationView {
        DetailEditView(data: $data)
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
                scrum.update(from: data)
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
      DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
  }
}
