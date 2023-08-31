//
//  LoginView.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 8/30/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var rePassword: String = ""
    @State var errorMessage: String = ""

    
    var body: some View {
        
        VStack{
            TextField("Email", text: $email)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .padding()
            
            SecureField("Password", text: $password)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .padding()
            
            Button(action: {
                    login(email: email, password: password)
                        }, label: {
                Text("Login")
                .frame(width: 88)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                )
            }
            )

        }
    }
    
    func login(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, errors in
            if errors != nil{
                print(errors!.localizedDescription)
            } else {
                print(result!.description)
            }
        }
    }

}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
