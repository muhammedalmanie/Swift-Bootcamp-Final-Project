
//  RegisterView.swift
//  FinalProject
//
//  Created by سكينه النجار on 30/08/2023.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State var email : String = ""
    @State var  password : String = ""
    @State var  repassword : String = ""
    @State var name  : String = ""
    @State var showAlert: Bool = false
    @EnvironmentObject var viewModel : AppViewModel
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image("launch")
                .resizable()
                .scaledToFit()
                .frame(width: 193, height: 90)
            Text("Create a New Account")
                .foregroundColor(.black)
                .bold()
            TextField("Enter Full name" ,text: $name)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.blue)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(18)
                .frame(height: 58)
                .frame(maxWidth: .infinity)
            TextField("Email", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.blue)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(18)
                .frame(height: 58)
                .frame(maxWidth: .infinity)
            SecureField("Password", text: $password)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.blue)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(18)
                .frame(height: 58)
                .frame(maxWidth: .infinity)
            SecureField("Re-Enter the password", text: $repassword)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.blue)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(18)
                .frame(height: 58)
                .padding(.bottom , 46)
                .frame(maxWidth: .infinity)
            if !password.isEmpty && !repassword.isEmpty {
                if password == repassword{
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemGreen))
                } else{
                    Image(systemName: "mark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemRed))
                }
            }
            Button {
                guard !name.isEmpty, !email.isEmpty, !password.isEmpty , password == repassword else {
                    return
                }
                viewModel.signUp(email: email, password: password)
                
                //                    viewModel.signUp(name: name ,email : email , password : password , repassword: repassword)
            } label: {
                Text("Register")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 58)
                    .background(Color(red:0.3608, green: 0.2157, blue: 0.5882))
                    .disabled(formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .cornerRadius(18)
                    .padding()
            }
            
            //            if password != repassword
            //            {
            //                Button(" Password not equal to Re-password") {
            //                    showAlert = true
            //                }
            //                .alert("Important message", isPresented: $showAlert) {
            //        Button("OK", role: .cancel) { }
            //                    .padding()
            Button{
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account")
                    Text("Sign In")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
                
            }
        }
        .padding(49)
        Spacer()
    }
}
extension LoginView :AuthenticationFormProtocol{
    var formIsValid : Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

//struct RegisterView: View {
//
//    @State var email: String = ""
//    @State var password: String = ""
//    @State var rePassword: String = ""
//    @State var errorMessage: String = ""
//
//
//    var body: some View {
//
//        VStack{
//            TextField("Email", text: $email)
//                           .textFieldStyle(RoundedBorderTextFieldStyle())
//                           .padding()
//
//            SecureField("Password", text: $password)
//                          .textFieldStyle(RoundedBorderTextFieldStyle())
//                          .padding()
//            SecureField("Re-Password", text: $rePassword)
//                          .textFieldStyle(RoundedBorderTextFieldStyle())
//                          .padding()
//
//            Text(errorMessage)
//                .foregroundColor(.red)
//                .padding()
//
//            Button(action: {
//                            if password == rePassword {
//                                register(email: email, password: password)
//                            } else {
//                                errorMessage = "passwords don't match"
//                            }
//                        }, label: {
//                Text("Sign Up")
//                .frame(width: 88)
//                .padding(.horizontal, 16)
//                .padding(.vertical, 8)
//                .foregroundColor(.black)
//                .background(
//                    RoundedRectangle(cornerRadius: 12)
//                        .foregroundColor(Color.clear)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 12)
//                                .stroke(Color.gray, lineWidth: 1)
//                        )
//                )
//            }
//            )
////            NavigationLink(destination: ForgotPasswordView(), isActive: $showForgotPassword) {
////                Text("Forgot Password?")
////            }
////            .padding()
//        }
//    }
//            func register(email: String, password: String){
//                Auth.auth().createUser(withEmail: email, password: password){ result, errors in
//                    if errors != nil{
//                        print(errors!.localizedDescription)
//                    } else {
//                        print(result!.description)
//                    }
//                }
//            }
//}
//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}
