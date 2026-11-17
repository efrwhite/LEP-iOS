//
//  FilterView.swift
//  LEP IOS
//
//  Created by Alex Cranford on 11/17/26.
//

import SwiftUI

struct FilterView: View {
    @State private var selectedMeal = "Breakfast"
    
    var body: some View {
        ZStack {
            backgroundMint.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Filter meals")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("MEAL TYPE")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
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
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 24)
            .padding(.top, 60)
        }
    }
}

#Preview {
    FilterView()
}
