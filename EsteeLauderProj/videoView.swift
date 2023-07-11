//
//  videoView.swift
//  EsteeLauderProj
//
//  Created by Laika Patel on 7/10/23.
//

import SwiftUI
import WebKit

struct videoView: View {
    let videoID: String
    
    var body: some View {
        VStack {
            Text("Video Demonstration")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: 0xCE3149))
                .multilineTextAlignment(.leading)
                .padding(.top)

            WebView(url: URL(string: "https://www.youtube.com/embed/\(videoID)")!)
                .frame(width: 300, height: 300)
                .cornerRadius(0)
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

