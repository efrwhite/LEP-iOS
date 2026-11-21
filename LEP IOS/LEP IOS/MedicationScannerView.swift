import SwiftUI

struct MedicationScannerView: View {
    @State private var selectedCategory: MedicationCategory = .medication
    @State private var medicationName: String = "Metformin 500mg"
    @State private var showSavedAlert: Bool = false

    enum MedicationCategory {
        case medication
        case supplement
    }

    var body: some View {
        ZStack {
            Color.bgMint.ignoresSafeArea()

            VStack(spacing: 20) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Spacer()
                            HStack(spacing: 6) {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 13, weight: .black))
                                Text("Label looks Clear")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 8)
                            .background(Color.deepPine)
                            .clipShape(Capsule())
                            Spacer()
                        }
                        .padding(.top, 10)

                        ZStack {
                            Color.cardWhite
                            DocumentIconShape()
                                .stroke(Color.deepPine, lineWidth: 3.5)
                                .frame(width: 60, height: 75)
                        }
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1.0, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .stroke(Color.vibrantMint, lineWidth: 1.5)
                        )

                        VStack(alignment: .leading, spacing: 4) {
                            Text(medicationName)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color(hex: "092C1F"))

                            Text("We can read the name and dose on this label")
                                .font(.system(size: 15))
                                .foregroundColor(.tealSlate)
                        }

                        HStack(spacing: 14) {
                            Button {
                                selectedCategory = .medication
                            } label: {
                                HStack(spacing: 10) {
                                    AtomSymbolIcon().frame(width: 22, height: 22)
                                    Text("Medication")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(Color(hex: "092C1F"))
                                    Spacer()
                                }
                                .padding(.horizontal, 14)
                                .padding(.vertical, 16)
                                .background(Color.cardWhite)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(selectedCategory == .medication ? Color.warmAmber : Color.sageBorder, lineWidth: selectedCategory == .medication ? 2 : 1)
                                )
                            }

                            Button {
                                selectedCategory = .supplement
                            } label: {
                                HStack(spacing: 10) {
                                    SparkleStarIcon()
                                        .stroke(Color(hex: "092C1F"), lineWidth: 1.8)
                                        .frame(width: 22, height: 22)
                                    Text("Supplement")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(Color(hex: "092C1F"))
                                    Spacer()
                                }
                                .padding(.horizontal, 14)
                                .padding(.vertical, 16)
                                .background(Color.cardWhite)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(selectedCategory == .supplement ? Color.vibrantMint : Color.sageBorder, lineWidth: selectedCategory == .supplement ? 2 : 1)
                                )
                            }
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
        .alert("Medication Logged", isPresented: $showSavedAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Saved \(medicationName) as \(selectedCategory == .medication ? "Medication" : "Supplement").")
        }
    }
}

struct DocumentIconShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let cornerFold: CGFloat = w * 0.35

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: w - cornerFold, y: 0))
        path.addLine(to: CGPoint(x: w, y: cornerFold))
        path.addLine(to: CGPoint(x: w, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.closeSubpath()

        path.move(to: CGPoint(x: w - cornerFold, y: 0))
        path.addLine(to: CGPoint(x: w - cornerFold, y: cornerFold))
        path.addLine(to: CGPoint(x: w, y: cornerFold))

        path.move(to: CGPoint(x: w * 0.22, y: h * 0.42))
        path.addLine(to: CGPoint(x: w * 0.42, y: h * 0.42))

        path.move(to: CGPoint(x: w * 0.22, y: h * 0.58))
        path.addLine(to: CGPoint(x: w * 0.78, y: h * 0.58))

        path.move(to: CGPoint(x: w * 0.22, y: h * 0.74))
        path.addLine(to: CGPoint(x: w * 0.78, y: h * 0.74))

        return path
    }
}

struct AtomSymbolIcon: View {
    var strokeColor: Color = Color(hex: "092C1F")
    var lineWidth: CGFloat = 1.8

    var body: some View {
        GeometryReader { geo in
            let r = geo.size.width * 0.22
            let cx = geo.size.width / 2
            let cy = geo.size.height / 2
            let offset = geo.size.width * 0.2
            ZStack {
                Circle().stroke(strokeColor, lineWidth: lineWidth).frame(width: r * 2, height: r * 2).position(x: cx - offset, y: cy - offset)
                Circle().stroke(strokeColor, lineWidth: lineWidth).frame(width: r * 2, height: r * 2).position(x: cx + offset, y: cy - offset)
                Circle().stroke(strokeColor, lineWidth: lineWidth).frame(width: r * 2, height: r * 2).position(x: cx - offset, y: cy + offset)
                Circle().stroke(strokeColor, lineWidth: lineWidth).frame(width: r * 2, height: r * 2).position(x: cx + offset, y: cy + offset)
            }
        }
    }
}

struct SparkleStarIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let cx = w / 2
        let cy = h / 2
        let inner: CGFloat = w * 0.18

        path.move(to: CGPoint(x: cx, y: 0))
        path.addLine(to: CGPoint(x: cx + inner, y: cy - inner))
        path.addLine(to: CGPoint(x: w, y: cy))
        path.addLine(to: CGPoint(x: cx + inner, y: cy + inner))
        path.addLine(to: CGPoint(x: cx, y: h))
        path.addLine(to: CGPoint(x: cx - inner, y: cy + inner))
        path.addLine(to: CGPoint(x: 0, y: cy))
        path.addLine(to: CGPoint(x: cx - inner, y: cy - inner))
        path.closeSubpath()
        return path
    }
}
