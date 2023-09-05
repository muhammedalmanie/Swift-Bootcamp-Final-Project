
//
//  AppViewModel.swift
//  TwaiqBoard
//
//  Created by سكينه النجار on 03/09/2023.
//


import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift
protocol AuthenticationFormProtocol {
    var formIsValid :Bool {get}
}
class AppViewModel : ObservableObject {
    @Published var signIn = false
    @Published var showAlert: Bool = false
    @Published var showNextPage: Bool = false
   // @Published private var showingAlert = false
    
    var isSiginIn : Bool {
        return Auth.auth().currentUser != nil
    }
    
    func signIn(email: String , password : String){
        Auth.auth().signIn(withEmail: email, password: password){[weak self] result , error in
            guard result != nil , error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            DispatchQueue.main.async {
                self?.signIn = true
            }
        }
    }
    
    func signUp(email: String , password : String){
        Auth.auth().createUser(withEmail: email, password: password){ result , error in
            guard result != nil , error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            DispatchQueue.main.async {
                self.signIn = true
            }
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.signIn = false
    }
}
