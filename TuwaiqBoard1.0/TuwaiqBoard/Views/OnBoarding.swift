//
//  ContentView.swift
//  FinalProject
//
//  Created by سكينه النجار on 29/08/2023.
//

import SwiftUI

struct Onboarding: View {
    @State private var currentTab = 0
    @State private var isAnimating: Bool = false
    @AppStorage("isOnBoarded") var isOnborded: Bool?
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.indigo,.mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                TabView(selection: $currentTab) {
                    ForEach(OnboardingData.list) { viewData in
                        setupOnboarding(data: viewData, listCount: OnboardingData.list.count)
                            .tag(viewData.id)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
        }
    }
    @ViewBuilder
    func setupOnboarding(data: OnboardingData , listCount: Int) -> some View{
        VStack(spacing: 20) {
            Image(systemName: data.img)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 300, alignment: .center)
                .scaleEffect(isAnimating ? 1 : 0.9)
            
            
            Text(data.primaryText)
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 41 / 255, green: 52 / 255, blue: 73 / 255))
            
            Text(data.secondaryText)
                .font(.headline)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 250)
                .foregroundColor(Color(red: 237 / 255, green: 203 / 255, blue: 150 / 255))
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
            
            
            Button(action: {
                if data.id == 2 {
                    isOnborded = true
                } else {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        currentTab = (currentTab + 1)%listCount
                    }
                }
            }, label: {
                Text(data.id != 2 ? "Next"  : "Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(red: 255 / 255, green: 115 / 255, blue: 115 / 255))
                    )
            }).shadow(radius: 10)
            
        }.onAppear(perform: {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.isAnimating = true
            }
        })
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
