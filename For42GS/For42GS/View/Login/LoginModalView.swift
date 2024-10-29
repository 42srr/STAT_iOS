//
//  LoginModalView.swift
//  For42GS
//
//  Created by Kimdohyun on 7/12/24.
//

import SwiftUI
@preconcurrency import WebKit

// WebView 정의
struct WebView: UIViewRepresentable {
    let url: URL
    var onNavigationChange: (URL) -> Void
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, onNavigationChange: onNavigationChange)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var onNavigationChange: (URL) -> Void
        
        init(_ parent: WebView, onNavigationChange: @escaping (URL) -> Void) {
            self.parent = parent
            self.onNavigationChange = onNavigationChange
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url {
                // URL이 변경될 때 콜백을 호출하여 처리
                onNavigationChange(url)
            }
            decisionHandler(.allow)
        }
    }
}

// LoginModalView 정의
struct LoginModalView: View {
    let url: URL
    @EnvironmentObject var service: Service
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        WebView(url: url) { callbackUrl in
            if let code = extractCode(from: callbackUrl) {
                print("Extracted code: \(code)")
                service.login(code: code)
                dismiss()
            }
        }
    }
    
    func extractCode(from url: URL) -> String? {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        return components?.queryItems?.first(where: { $0.name == "code" })?.value
    }
}


#Preview {
    LoginModalView(url: URL(string: "https://example.com")!)
        .environmentObject(Service())
}
