//
//  RegisterView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/27/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

struct RegisterView: View {
    
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
            SecureField("Re-Password", text: $rePassword)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .padding()
            
            Text(errorMessage)
                .foregroundColor(.red)
                .padding()
            
            Button(action: {
                            if password == rePassword {
                                register(email: email, password: password)
                            } else {
                                errorMessage = "passwords don't match"
                            }
                        }, label: {
                Text("Sign Up")
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
//            NavigationLink(destination: ForgotPasswordView(), isActive: $showForgotPassword) {
//                Text("Forgot Password?")
//            }
//            .padding()
        }
    }
            func register(email: String, password: String){
                Auth.auth().createUser(withEmail: email, password: password){ result, errors in
                    if errors != nil{
                        print(errors!.localizedDescription)
                    } else {
                        print(result!.description)
                    }
                }
            }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
