//
//  customFontView.swift
//  EsteeLauderProj
//
//  Created by Laika Patel on 7/10/23.
//

import SwiftUI
import UIKit

struct CustomFontView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        guard let customFont = UIFont(name: "ultralight", size: 17) else {
            return
        }
        
        if let label = uiView as? UILabel {
            label.font = customFont
            label.text = "Hello, World!"
        }
    }
}

