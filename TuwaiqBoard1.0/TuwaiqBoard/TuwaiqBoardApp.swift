
//
//  TwaiqBoardApp.swift
//  TwaiqBoard
//
//  Created by سكينه النجار on 03/09/2023.
//

import SwiftUI
import Firebase
@main
struct TwaiqBoardApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("isOnBoarded") var isOnborded: Bool = false
    @ObservedObject var viewModel = AppViewModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            //RegisterView()
                        NavigationView {
                            if isOnborded {
                                if viewModel.signIn {
                                    TabBarView()
                                } else {
                                    LoginView()
                                }
                            } else {
                                Onboarding()
                            }
                        }.onAppear {
                            viewModel.signIn = viewModel.isSiginIn
                        }
                        .environmentObject(viewModel)
                    }
        }
    }

class AppDelegate: NSObject , UIApplicationDelegate{
    func application( _application:UIApplication, didFinishLaunchingWithOptions LaunchOptions:
                      [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


