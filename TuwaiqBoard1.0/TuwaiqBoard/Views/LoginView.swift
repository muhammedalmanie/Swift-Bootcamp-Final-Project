
//
//  LoginView.swift
//  FinalProject
//
//  Created by سكينه النجار on 30/08/2023.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    @State var email : String = ""
    @State var name  : String = ""
    @State var password : String = ""
    @State var showNextPage: Bool = false
    @EnvironmentObject var viewModel : AppViewModel
    
    var body: some View {
        // NavigationView {
        if showNextPage == true {
            Text("new page")
        } else {
            VStack{
                Image("launch")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 193, height: 90)
                    .padding(.bottom, 96)
                VStack{
                    TextField("Emaill Adress" ,text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(18)
                        .frame(height: 58)
                        .frame(maxWidth: .infinity)
                    SecureField("Password " ,text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(18)
                        .frame(height: 58)
                        .padding(.bottom , 46)
                        .frame(maxWidth: .infinity)
                    Button {
                        guard !email.isEmpty, !password.isEmpty  else {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    } label: {
                        Text("LOGIN")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 58)
                            .background(Color(red:0.3608, green: 0.2157, blue: 0.5882))
                            .disabled(formIsValid)
                            .opacity(formIsValid ? 1.0 : 0.5)
                            .cornerRadius(18)
                    }
                    
                    NavigationLink{
                        RegisterView()
                            .navigationBarBackButtonHidden(true)
                            .foregroundColor(Color(red:0.3608, green: 0.2157, blue: 0.5882))
                            .frame(height: 58)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    label : {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                            Text("Register")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    }
                    //                    NavigationLink("Register" , destination: RegisterView().environmentObject(viewModel))
                    //                        .foregroundColor(Color(red:0.3608, green: 0.2157, blue: 0.5882))
                    //                        .frame(width: 160, height: 20)
                    //                        .padding()
                }
                
            }
            .padding(49)
            Spacer()
        }
    }
}
extension RegisterView : AuthenticationFormProtocol {
var formIsValid : Bool {
    return !email.isEmpty
    && email.contains("@")
    && !password.isEmpty
    && password.count > 5
    
}
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

