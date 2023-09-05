//
//  CourseModel.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 8/28/23.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Bootcamp: Codable, Identifiable {
    var id = UUID()
    var title: String
    var imgSrc: String
    var attendance: String
    var startDate: String
    var location: String
    var description: String
}



//func loadBootcampsFromJSON() -> [Bootcamp] {
//    if let fileURL = Bundle.main.url(forResource: "bootcamps", withExtension: "json") {
//        do {
//            let data = try Data(contentsOf: fileURL)
//            let decoder = JSONDecoder()
//            let bootcamps = try decoder.decode([Bootcamp].self, from: data)
//            return bootcamps
//        } catch {
//            print("Error decoding JSON: \(error)")
//        }
//    }
//    return []
//}
//
//
//func uploadBootcampsToFirestore(bootcamps: [Bootcamp]) {
//    let db = Firestore.firestore()
//    
//    for bootcamp in bootcamps {
//        let bootcampData: [String: Any] = [
//            "title": bootcamp.title,
//            "imgSrc": bootcamp.imgSrc.absoluteString,
//            "attendance": bootcamp.attendance,
//            "startDate": bootcamp.startDate,
//            "location": bootcamp.location,
//            "description": bootcamp.description
//        ]
//        
//        db.collection("bootcamps").addDocument(data: bootcampData) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document added successfully.")
//            }
//        }
//    }
//}






//
//struct CourseModel: Codable, Identifiable {
//    var id: UUID = .init()
////    var content: Optional<String>
////    var attachments: Array<URL>
////    var createdBy: UserModel.ID
////    let createdAt: Date
////    var replies: Array<UserModel.ID>
////    var likes: Array<UserModel.ID>
//
//    //var type: String
//
//    var name: String
//    var location: String
//    //var duration: String
//    var startDate: Date
//    var status: String
//    //end date
//
//    //description
//
//}
//
//struct Course {
//    let id: String
//    let name: String
//    let enrolled: Bool
//    var agenda: [AgendaItem]
//    var grades: [Grade]
//    var announcements: [Announcement]
//}
//
//struct Student {
//    let id: String
//    let name: String
//    let enrolledCourses: [String]
//}
//
//struct AgendaItem {
//    let id: String
//    let title: String
//    let description: String
//}
//
//struct Grade {
//    let id: String
//    let title: String
//    let score: Double
//}
//
//struct Announcement {
//    let id: String
//    let title: String
//    let content: String
//}
