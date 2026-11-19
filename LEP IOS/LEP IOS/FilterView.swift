//
//  FilterView.swift
//  LEP IOS
//
//  Created by Alex Cranford on 11/17/26.
//

import SwiftUI

struct FilterView: View {
    @State private var selectedMeal = "Breakfast"
    @State private var selectedRange = "Past 7 Days"
    var body: some View {
        ZStack {
            backgroundMint.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 14) {
                Text("Filter meals")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 16)

                VStack(alignment: .leading, spacing: 10) {
                    Text("MEAL TYPE")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)

                    HStack(spacing: 24) {
                        Button {
                            selectedMeal = "Breakfast"
                        } label: {
                            Text("Breakfast")
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(selectedMeal == "Breakfast" ? Color.white : Color.black)
                                .background(selectedMeal == "Breakfast" ? primaryGreen : offWhite)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(primaryGreen, lineWidth: 1))
                        }

                        Button {
                            selectedMeal = "Lunch"
                        } label: {
                            Text("Lunch")
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(selectedMeal == "Lunch" ? Color.white : Color.black)
                                .background(selectedMeal == "Lunch" ? primaryGreen : offWhite)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(primaryGreen, lineWidth: 1))
                        }

                        Button {
                            selectedMeal = "Dinner"
                        } label: {
                            Text("Dinner")
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(selectedMeal == "Dinner" ? Color.white : Color.black)
                                .background(selectedMeal == "Dinner" ? primaryGreen : offWhite)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(primaryGreen, lineWidth: 1))
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Date Range")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)
                    Menu {
                        Button("Today") { selectedRange = "Today" }
                        Button("Past 7 Days") { selectedRange = "Past 7 Days" }
                        Button("Past 30 Days") { selectedRange = "Past 30 Days" }
                    } label: {
                        HStack(spacing: 24) {
                            Image(systemName: "calendar")
                            Text(selectedRange)
                            Spacer()
                        }
                        .foregroundStyle(Color.black)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 24)
                        .background(offWhite)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(primaryGreen, lineWidth: 1))
                    }
                    .padding(.horizontal, 6)
                }

                Text("Today 7:40 AM")
                    .font(.title2)
                    .foregroundStyle(Color.gray)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 30)

                Rectangle()
                    .fill(gray)
                    .frame(height: 260)
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 50))
                            .foregroundStyle(Color.black)
                    )
                    .padding(.horizontal, 6)

                Spacer()

                Button {

                } label: {
                    Text("Confirm")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 44)
                        .background(red)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    FilterView()
}
