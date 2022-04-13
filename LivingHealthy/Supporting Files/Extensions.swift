
import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    
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
}



extension Image {
    init(stringURL: String) {
        let name = String(stringURL.split(separator: ".")[0])
        let ext = String(stringURL.split(separator: ".")[1])
        var uiImage = UIImage()
        
        do {
            if let filePath = Bundle.main.url(forResource: name, withExtension: ext) {
                let imageData = try Data(contentsOf: filePath)
                uiImage = UIImage(data: imageData)!
            } else {
            }
        } catch let error {
            print("[System] Error while bring local image: \(error)")
            self.init(systemName: "xmark")
        }
        self.init(uiImage: uiImage)
    }
}

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
