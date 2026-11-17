//
//  FilterView.swift
//  LEP IOS
//
//  Created by Alex Cranford on 11/17/26.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        ZStack {
            backgroundMint.ignoresSafeArea()
            
            VStack (alignment: .leading, spacing: 15) {
                Text("Filter Meals")
                    .font(.title)
                    .bold()
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
