//
//  LoginPageView.swift
//  For42GS
//
//  Created by Kimdohyun on 4/25/24.
//

import SwiftUI

struct LoginPageView: View {
    //MARK: - 1. PROPERTY
    
    @EnvironmentObject var service : Service
    @State private var showWebView = false
    
    
    //MARK: - 2. BODY
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                logo
                Spacer()
                loginButton
                Spacer()
                Spacer()
            }
            .background(Color.white)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .sheet(isPresented: $showWebView) {
                LoginModalView(url: service.login_Url)
            }
        }
    }
}

//MARK: - 3. EXTENSION

extension LoginPageView {
    
    var logo: some View {
        Image("tool_logo")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.getWidth(390))
    }
    
    var loginButton: some View {
        VStack(spacing: UIScreen.getWidth(5)) {
            HStack(spacing: UIScreen.getWidth(8)) {
                Button {
                    showWebView = true
                } label: {
                    Text("Login")
                        .frame(width: UIScreen.getWidth(320), height: UIScreen.getHeight(52))
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.4), radius: UIScreen.getHeight(5))
                }
            }
        }
    }
}

//MARK: - 4. PREVIEW
#Preview {
    LoginPageView().environmentObject(Service())
}
