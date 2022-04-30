//
//  Extensions1.swift
//  LivingHealthy
//
//  Created by Rachael Hanson
//


import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    
    @State private var showingAlert = false

    //embeding youtube videos into app
    let videoID: String
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let ytURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: ytURL))
    }


func webViewDidClose(_ videoView: WKWebView) {
    
    Alert(title: Text("Title"), message: Text("did close"), dismissButton: .default(Text("Close")))
    
}}


extension View {
    func encapulate(color: Color, foregroundColor: Color = .black) -> some View {
        return self
            .padding(7)
            .padding(.horizontal, 5)
            .background(Capsule().fill(color))
            .foregroundColor(foregroundColor)
    }

    func encapulate(borderColor: Color) -> some View {
        return self
            .padding(7)
            .padding(.horizontal, 5)
            .overlay(Capsule().stroke(borderColor))
    }
}
