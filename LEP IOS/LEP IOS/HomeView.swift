//
//  HomeView.swift
//  LEP IOS
//

import SwiftUI


enum MealType: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .breakfast: return "cup.and.saucer"
        case .lunch:     return "takeoutbag.and.cup.and.straw"
        case .dinner:    return "fork.knife"
        }
    }
}

struct HomeView: View {
    @State private var selectedMeal: MealType? = nil
    @State private var isEnglish = true

    var body: some View {
        ZStack {
            backgroundMint.ignoresSafeArea()

            VStack(spacing: 32) {
                header
                mealButtons
                cameraCard
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
    }


    private var header: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundStyle(darkGreen)
                .background(Circle().fill(Color.gray.opacity(0.2)).padding(-4))

            Spacer()

            Button {
                isEnglish.toggle()
            } label: {
                HStack(spacing: 10) {
                    Circle()
                        .stroke(darkGreen, lineWidth: 1.5)
                        .frame(width: 18, height: 18)
                    Text(isEnglish ? "EN" : "ES")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(.black)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .background(Capsule().fill(Color.white))
                .overlay(Capsule().stroke(lightGreen, lineWidth: 1.5))
            }
        }
    }


    private var mealButtons: some View {
        HStack(spacing: 16) {
            ForEach(MealType.allCases) { meal in
                Button {
                    selectedMeal = meal
                } label: {
                    VStack(spacing: 12) {
                        Image(systemName: meal.icon)
                            .font(.system(size: 30))
                            .foregroundStyle(orange)
                        Text(meal.rawValue)
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(selectedMeal == meal ? backgroundMint : offWhite)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lightGreen, lineWidth: selectedMeal == meal ? 2.5 : 1)
                    )
                }
            }
        }
    }

    private var cameraCard: some View {
        Button {
            
        } label: {
            VStack(spacing: 24) {
                Spacer()

                Circle()
                    .fill(orange)
                    .frame(width: 140, height: 140)
                    .overlay(
                        Image(systemName: "camera")
                            .font(.system(size: 44, weight: .semibold))
                            .foregroundStyle(.black)
                    )

                VStack(spacing: 4) {
                    Text("Take a photo of your food")
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                    Text("Tap to start")
                        .font(.system(size: 15))
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 40)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(RoundedRectangle(cornerRadius: 14).fill(primaryGreen))
        }
    }
}

#Preview {
    HomeView()
}
