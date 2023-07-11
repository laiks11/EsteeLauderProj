//
//  wordsSelected.swift
//  EsteeLauderProj
//
//  Created by Laika Patel on 7/10/23.
//

import SwiftUI

struct wordsSelected: View {
    let selectedWords: [String]
    
    var body: some View {
        VStack {
            Text("Your skin is")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundColor(Color(hex: 0xCE3149))
                .padding(.top, 20)
            
            Text(selectedWords.joined(separator: ", "))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: 0xCE3149))
        }
    }
}

