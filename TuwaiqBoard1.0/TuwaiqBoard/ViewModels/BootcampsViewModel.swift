//
//  BootcampsViewModel.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 9/4/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift



class BootcampsViewModel: ObservableObject{
    let db = Firestore.firestore()
    @Published var bootcamps: [Bootcamp] = []

    func uploadBootcampsToFirestore(bootcamps: [Bootcamp]) {
        for bootcamp in bootcamps {
            let bootcampData: [String: Any] = [
                "id": bootcamp.id.uuidString,
                "title": bootcamp.title,
                "imgSrc": bootcamp.imgSrc,
                "attendance": bootcamp.attendance,
                "startDate": bootcamp.startDate,
                "location": bootcamp.location,
                "description": bootcamp.description
            ]
            
            db.collection("bootcamps").addDocument(data: bootcampData) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added successfully.")
                }
            }
        }
    }

    
    func loadBootcampsFromJSON() -> [Bootcamp] {
        if let fileURL = Bundle.main.url(forResource: "bootcamps", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let bootcamps = try decoder.decode([Bootcamp].self, from: data)
                print("Loaded Bootcamps: \(bootcamps)")

                return bootcamps
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("JSON file not found.")
        }
        return []
    }
    
    
    func fetchBootcamps() {
        db.collection("bootcamps").addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }

            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.bootcamps = documents.compactMap { document in
                do {
                    if let data = document.data() as? [String: Any] {
                        let jsonData = try JSONSerialization.data(withJSONObject: data)
                        let decoder = JSONDecoder()
                        let bootcamp = try decoder.decode(Bootcamp.self, from: jsonData)
                        return bootcamp
                    } else {
                        return nil
                    }
                } catch {
                    print("Error decoding bootcamp: \(error)")
                    return nil
                }
            }
        }
    }

    

}

