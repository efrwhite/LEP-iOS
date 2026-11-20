//  WelcomeView.swift
//  LEP IOS
// Created by Alex Cranford on 10/24


import SwiftUI

struct WelcomeView: View {
    @State private var navigateToLogin = false
    @State private var navigateToRegister = false
    
    var body: some View {
        ZStack {
            backgroundMint
                .ignoresSafeArea()

            VStack {
                Spacer()

                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)

                Spacer()
                Spacer()

                HStack(spacing: 16) {
                    Button {
                        navigateToRegister = true
                    } label: {
                        Text("Register")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(darkGreen)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .overlay(
                                Capsule()
                                    .stroke(darkGreen, lineWidth: 2)
                            )
                    }

                    Button {
                        navigateToLogin = true
                    } label: {
                        Text("Login")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(darkGreen)
                            .clipShape(Capsule())
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 60)
            }
        }
        .navigationDestination(isPresented: $navigateToLogin) {
            LoginRootView()
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $navigateToRegister) {
            RegisterRootView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
    }
}
