//
//  ContentView.swift
//  For42GS
//
//  Created by Kimdohyun on 3/8/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var service : Service
    
    var body: some View {
        VStack {
            Spacer()
            logo
            idfield
            passField
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

extension LoginView {
    
    var logo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.getWidth(250))
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

#Preview {
    LoginView().environmentObject(Service())
}
