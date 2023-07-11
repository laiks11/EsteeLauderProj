//
//  skincareRoutine.swift
//  EsteeLauderProj
//
//  Created by Laika Patel on 7/10/23.
//
import SwiftUI

struct skincareRoutine: View {
    @State private var selectedWords: [String] = []
    @State private var showSelectedWords = false
    @State private var name = "selectedWords"
    
    var body: some View {
        NavigationView {
            VStack {
                logoView() // Replace `LogoView()` with the actual implementation of your logo view
                    .padding(.top)
                Spacer()
                
                VStack {
                    Text("Choose a word that best describes your skin")
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    wordsSelected(selectedWords: selectedWords)
                    
                    NavigationLink(destination: wordsSelected(selectedWords: selectedWords),
                                   isActive: $showSelectedWords) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        showSelectedWords = true
                    }) {
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .background(Color(hex: 0xE17C8C))
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: 0xCE3149))
            .edgesIgnoringSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}



