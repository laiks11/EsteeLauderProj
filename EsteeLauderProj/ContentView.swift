//
//  ContentView.swift
//  EsteeLauderProj
//
//  Created by Laika Patel on 7/7/23.
//
import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                logoView()
                Spacer()
                Image("welcomeImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 350, maxHeight: .infinity)
                    .padding(.horizontal)
                
                NavigationLink(destination: homePage()) {
                    Rectangle()
                        .fill(Color(hex: 0xE17C8C))
                        .frame(width: 315, height: 50) // Adjust the width and height as desired
                        .overlay(Text("Get Started")
                        .foregroundColor(.white)
                        .font(.headline)
                                       )
                               }
                Spacer().frame(height:100)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(hex: 0xCE3149)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(
            .sRGB,
            red: red,
            green: green,
            blue: blue,
            opacity: alpha
        )
    }
}


