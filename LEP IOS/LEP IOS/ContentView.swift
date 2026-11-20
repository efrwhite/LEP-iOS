//  ContentView.swift
//  LEP IOS

import SwiftUI


let backgroundMint = Color(red: 232/255, green: 245/255, blue: 238/255)
let darkGreen      = Color(red: 17/255,  green: 91/255,  blue: 59/255)
let lightGreen     = Color(red: 84/255,  green: 175/255, blue: 136/255)
let mutedGreen     = Color(red: 130/255, green: 169/255, blue: 152/255)

struct ContentView: View {
    var body: some View {
        LanguageSelectView()
    }
}

struct LanguageSelectView: View {

    @State private var selectedLanguage = "English"

    private let languages = ["English", "Español", "한국어", "Français", "Deutsch"]

    var body: some View {
        ZStack {

            backgroundMint
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .padding(.bottom, 24)

                Text("CHOOSE YOUR LANGUAGE")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(darkGreen)
                    .padding(.bottom, 8)

                Text("Elige tu idioma, Choisissez votre langue\n언어를 선택하세요, Wählen Sie Ihre Sprache")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(lightGreen)
                    .padding(.bottom, 40)

                VStack(spacing: 16) {
                    ForEach(languages, id: \.self) { language in
                        let isSelected = selectedLanguage == language

                        Button {
                            selectedLanguage = language
                        } label: {
                            Text(language)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(isSelected ? darkGreen : mutedGreen)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .stroke(lightGreen, lineWidth: isSelected ? 0 : 2)
                                )
                        }
                    }
                }
                .padding(.horizontal, 40)

                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
