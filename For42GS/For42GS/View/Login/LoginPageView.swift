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
    
//MARK: - 2. BODY
    
    var body: some View {
        
        NavigationView {
            VStack {
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
        }
    }
}

//MARK: - 3. EXTENSION

extension LoginPageView {
    
    var logo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.getWidth(550))
    }
    var idfield: some View {
        VStack(spacing: UIScreen.getWidth(5)) {
            HStack(spacing: UIScreen.getWidth(8)) {
                TextField("Intra ID", text: $service.auth.intraId)
                    .padding(UIScreen.getWidth(15))
                    .background(.ultraThinMaterial)
                    .cornerRadius(6)
                    .shadow(color: .black.opacity(0.4), radius: UIScreen.getHeight(5))
            }
        }.padding(UIScreen.getWidth(12))
    }
    
    var passField: some View {
        VStack(spacing: UIScreen.getWidth(5)) {
            HStack(spacing: UIScreen.getWidth(8)) {
                SecureField("Password", text: $service.auth.intraPass)
                    .padding(UIScreen.getWidth(15))
                    .background(.ultraThinMaterial)
                    .cornerRadius(6)
                    .shadow(color: .black.opacity(0.4), radius: UIScreen.getHeight(5))
            }
        }.padding(UIScreen.getWidth(12))
    }
    
    var loginButton: some View {
        VStack(spacing: UIScreen.getWidth(5)) {
            HStack(spacing: UIScreen.getWidth(8)) {
                Button {
                    service.isLogin = true
                } label: {
                    Text("Login")
                        .frame(width: UIScreen.getWidth(370), height: UIScreen.getHeight(52))
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
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
