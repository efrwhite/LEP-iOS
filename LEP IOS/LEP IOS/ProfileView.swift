//
//  ProfileView.swift
//  LEP IOS
//
//  Created by Alex Cranford on 11/19/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            backgroundMint.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 24) {
                        profileHeader
                        
                        shareLogCard
                        
                        settingsSection
                        
                        signOutButton
                            .padding(.top, 32)
                            .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                }
            }
        }
    }
    
    private var profileHeader: some View {
        HStack(spacing: 20) {
            Circle()
                .stroke(primaryGreen, lineWidth: 3)
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.system(size: 36))
                        .foregroundColor(primaryGreen)
                )
                .background(Circle().fill(offWhite))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Anush Pradhan")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Text("VCU School of Business")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                Button(action: {}) {
                    Text("Edit Profile")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(brandOrange)
                        .cornerRadius(6)
                }
                .padding(.top, 4)
            }
            
            Spacer()
        }
    }
    
    private var shareLogCard: some View {
        Button(action: {}) {
            HStack(spacing: 20) {
                Circle()
                    .fill(brandOrange)
                    .frame(width: 80, height: 80)
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Share log with the Clinic")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Text("Send photo to the doctor")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            .padding(20)
            .background(offWhite)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(brandOrange, lineWidth: 2)
            )
        }
    }
    
    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("SETTINGS")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black.opacity(0.6))
                .padding(.bottom, 12)
            
            VStack(spacing: 0) {
                settingsRow(
                    icon: "globe",
                    title: "Language",
                    subtitle: "English"
                )
                
                Divider()
                    .padding(.leading, 100)
                
                settingsRow(
                    icon: "text.alignleft",
                    title: "Text Size",
                    subtitle: "Large"
                )
                
                Divider()
                    .padding(.leading, 100)
                
                settingsRow(
                    icon: "bell",
                    title: "Reminders",
                    subtitle: "3 times a day"
                )
                
                Divider()
                    .padding(.leading, 100)
                
                settingsRow(
                    icon: "lock",
                    title: "Privacy & what we share",
                    subtitle: nil
                )
            }
            .background(offWhite)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(primaryGreen, lineWidth: 2)
            )
        }
    }
    
    private func settingsRow(icon: String, title: String, subtitle: String?) -> some View {
        Button(action: {}) {
            HStack(spacing: 20) {
                Circle()
                    .fill(backgroundMint)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: icon)
                            .font(.system(size: 26))
                            .foregroundColor(primaryGreen)
                    )
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.system(size: 16))
                            .foregroundColor(.black.opacity(0.6))
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 16))
                    .foregroundColor(.black.opacity(0.3))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
    }
    
    private var signOutButton: some View {
        Button(action: {}) {
            Text("Sign out")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(red)
        }
    }
}

#Preview {
    ProfileView()
}
