//
//  reviewSection.swift
//  EsteeLauderProj
//
//  Created by Laika Patel on 7/10/23.
//

import SwiftUI

struct reviewSection: View {
    let rating: Int
    let title: String
    let reviewText: String
    let reviewer: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(0..<rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding(.bottom, 4)
            
            Text(title)
                .font(.headline)
                .foregroundColor(Color(hex: 0xCE3149))

            
            Text(reviewText)
                .font(.body)
                .foregroundColor(Color(hex: 0xE17C8C))
            
            Text("- \(reviewer)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(hex: 0xF8F1F3))
        .cornerRadius(0)
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}


