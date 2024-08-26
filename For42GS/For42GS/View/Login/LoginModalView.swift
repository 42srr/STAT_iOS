//
//  LoginModalView.swift
//  For42GS
//
//  Created by Kimdohyun on 7/12/24.
//

import SwiftUI
import WebKit

struct LoginModalView: UIViewRepresentable {
//MARK: - 1. PROPERTY
    
    @EnvironmentObject var service : Service
    
//MARK: - 2. BODY
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: service.callBackUrl)
        uiView.load(request)
    }
}

#Preview {
    LoginModalView().environmentObject(Service())
}
