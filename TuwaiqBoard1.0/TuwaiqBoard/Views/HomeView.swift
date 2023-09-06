//
//  HomeView.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 8/31/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

struct HomeView: View {

    @ObservedObject var bootcampsViewModel = BootcampsViewModel()

    @State var searchedText: String = ""

    
    
    var body: some View {
        VStack{
            
            HStack {
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(Color(red: 0.3608, green: 0.2157, blue: 0.5882))
                    .font(.title)
                    .padding(.horizontal)
            }
         
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchedText)
                
                
            }
            .padding(10)
            .frame(maxWidth: .infinity)
                        .padding(.horizontal, 15)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.gray)
                                
                            )
                            .padding()
            ScrollView{
                HStack {
                    Text("My Bootcamp")
                        .bold()
                        .font(.title)
                        .padding(.horizontal)
                    Spacer()
                }
                
                CustomPurpleCard(title: "iOS development bootcamp", subtitle: "July - September")
                
                    .padding()
                
                
                HStack {
                    Text("Other Courses")
                        .bold()
                        .font(.title)
                        .padding(.horizontal)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 13) {
                        ForEach(bootcampsViewModel.loadBootcampsFromJSON().filter { $0.title.lowercased().contains(searchedText.lowercased()) }) { bootcamp in
                            OtherCoursesCards(title: bootcamp.title, subtitle: bootcamp.startDate)
                                .padding()
                        }
                    }
                }
                
                HStack {
                    Text("Other Courses")
                        .bold()
                        .font(.title)
                        .padding(.horizontal)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 13) {
                        OtherCoursesCards(title: "Course 1", subtitle: "Subtitle 1")
                        OtherCoursesCards(title: "Course 2", subtitle: "Subtitle 2")
                        OtherCoursesCards(title: "Course 3", subtitle: "Subtitle 3")
                    }
                    .padding()
                }
            }
            
            Spacer()

        }
        
        .onAppear {
            bootcampsViewModel.fetchBootcamps()
        }
        
            
Spacer()
            
  
        }
    
    
//    private func formatDate(_ date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM yyyy"
//        return formatter.string(from: date)
    //}
    
    
}



struct CustomPurpleCard: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Text(subtitle)
                .font(.subheadline)
                .bold()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.3608, green: 0.2157, blue: 0.5882),
                Color(red: 0.3608, green: 0.2157, blue: 0.5882),
                Color(red: 0.8, green: 0.7, blue: 0.9)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ))
        .cornerRadius(25)
    }
}

struct OtherCoursesCards: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.black)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .frame(width: 220, height: 150)
        .background(Color.white)
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(red: 0.3608, green: 0.2157, blue: 0.5882), lineWidth: 1)
        )
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
