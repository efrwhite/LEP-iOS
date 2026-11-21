import SwiftUI

struct BloodSugarLogView: View {
    @State private var bloodSugar: Int = 128
    @State private var selectedTiming: String = "Before  a meal"
    @State private var dateTime: String = "Today , 12:15 PM"
    @State private var showSavedAlert: Bool = false

    let timingOptions = [
        "Fasting (Before Breakfast)",
        "Before  a meal",
        "1-2hrs after a meal",
        "Bedtime"
    ]

    var body: some View {
        ZStack {
            Color.bgMint.ignoresSafeArea()

            VStack(spacing: 20) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Blood Sugar Log")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(hex: "092C1F"))

                            Text("OPTIONAL")
                                .font(.system(size: 11, weight: .bold))
                                .tracking(1)
                                .foregroundColor(.deepPine)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 4)
                                .overlay(
                                    Capsule().stroke(Color.sageBorder, lineWidth: 1.2)
                                )
                        }
                        .padding(.top, 10)

                        VStack(spacing: 4) {
                            Text("\(bloodSugar)")
                                .font(.system(size: 64, weight: .bold))
                                .foregroundColor(.deepPine)

                            Text("mg/dL")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.deepPine)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 28)
                        .background(Color.cardWhite)
                        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .stroke(Color.sageBorder, lineWidth: 1.5)
                        )

                        VStack(alignment: .leading, spacing: 8) {
                            Text("WHEN")
                                .font(.system(size: 12, weight: .bold))
                                .tracking(0.8)
                                .foregroundColor(.deepPine)
                                .padding(.horizontal, 4)

                            VStack(spacing: 4) {
                                ForEach(timingOptions, id: \.self) { option in
                                    let isSelected = selectedTiming == option
                                    Button {
                                        withAnimation(.easeInOut(duration: 0.2)) {
                                            selectedTiming = option
                                        }
                                    } label: {
                                        HStack {
                                            Text(option)
                                                .font(.system(size: 16, weight: isSelected ? .medium : .regular))
                                                .foregroundColor(.tealSlate)
                                            Spacer()
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 14)
                                        .background(isSelected ? Color.bgMint : Color.clear)
                                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                    }
                                }
                            }
                            .padding(8)
                            .background(Color.cardWhite)
                            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 24, style: .continuous)
                                    .stroke(Color.sageBorder, lineWidth: 1.5)
                            )
                        }

                        Button {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "h:mm a"
                            dateTime = "Today , \(formatter.string(from: Date()))"
                        } label: {
                            HStack {
                                Text("Date & time")
                                    .font(.system(size: 16))
                                    .foregroundColor(.tealSlate)
                                Spacer()
                                Text(dateTime)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.deepPine)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 18)
                            .background(Color.cardWhite)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .stroke(Color.sageBorder, lineWidth: 1.5)
                            )
                        }
                    }
                    .padding(.horizontal, 24)
                }

                Button {
                    showSavedAlert = true
                } label: {
                    Text("Save reading")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.primaryGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: Color.primaryGreen.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            }
        }
        .alert("Reading Saved", isPresented: $showSavedAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Logged \(bloodSugar) mg/dL for \(selectedTiming).")
        }
    }
}
