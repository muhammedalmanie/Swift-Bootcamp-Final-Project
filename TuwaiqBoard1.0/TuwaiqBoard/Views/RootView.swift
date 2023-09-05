//
//  RootView.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 9/3/23.
//

import Foundation
import SwiftUI



struct RootView: View {
    var body: some View {


        ZStack{
                    HStack{
                        Button {
                            //switch to home
                        } label: {
                            
                            VStack(alignment: .center, spacing: 3){
                                Image(systemName: "house")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24,height: 24)
                                    .cornerRadius(8)
                                Text("Board")
                                
                            }
                        }
                        
                        
                        Button {
                            //switch to Board
                        } label: {
                            
                            VStack(alignment: .center, spacing: 3){
                                Image(systemName: "book.closed.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24,height: 24)
                                    .cornerRadius(8)
                                Text("Bootcamps")
                                
                            }
                            .animation(.easeIn, value: 5)
                            
                        }
                       
                       

                        Button {
                            //switch to bootcamps
                        } label: {
                            
                            VStack(alignment: .center, spacing: 3){
                                Image(systemName: "person.3.sequence.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24,height: 24)
                                    .cornerRadius(8)
                                Text("anyname")
                                
                            }
                            
                        }
                        
                        
                        Button {
                            //switch to More page(profile and settings)
                        } label: {
                            
                            VStack(alignment: .center, spacing: 3){
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24,height: 24)
                                    .cornerRadius(8)
                                Text("More")
                                    
                            }
                            
                            
                        }
                        
                       
                        
                        
                    }
                   
                    
                    
                    
                    
                }
                .bold()
                .foregroundColor(.indigo)
                .padding()
                
            }
        
        
        
       
    }




