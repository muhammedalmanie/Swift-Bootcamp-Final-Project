//
//  CurrentBootcampCategoriesViews.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 9/3/23.
//

import Foundation
import SwiftUI


struct AgendaView: View {
    @State private var selectedWeek = 1
    
    var body: some View {
        VStack {
            // Horizontal Scrollable Options for Weeks
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1..<9, id: \.self) { week in
                        Button(action: {
                            selectedWeek = week
                        }) {
                            Text("Week \(week)")
                                .foregroundColor(selectedWeek == week ? Color.white : Color.black)                                .font(.headline)
                                .padding()
                                .background(selectedWeek == week ? Color(red: 0.3608, green: 0.2157, blue: 0.5882) : Color.clear)
                                .cornerRadius(18)
                        }
                    }
                }
            }
            
            // Display Specific Details for the Selected Week
            selectedWeekDetails
        }
        .padding()
    }
    
    var selectedWeekDetails: some View {
        switch selectedWeek {
        case 1:
            return AnyView(Week1View())
        case 2:
            return AnyView(Week2View())
        case 3:
            return AnyView(Week3View())
        case 4:
            return AnyView(Week4View())
        case 5:
            return AnyView(Week5View())
        case 6:
            return AnyView(Week6View())
        case 7:
            return AnyView(Week7View())
        case 8:
            return AnyView(Week8View())
        default:
            return AnyView(Week1View())
        }
    }
}

struct InstructorsView: View {
    var body: some View {


        Text("Instructors Content")
    }
}

struct AssignmentsView: View {
    var body: some View {


        Text("Assignments Content")
    }
}

struct GradesView: View {
    var body: some View {


        Text("Grades Content")
    }
}

struct EvaluationView: View {
    var body: some View {


        Text("Evaluation Content")
    }
}
