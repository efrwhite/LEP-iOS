import SwiftUI

// MARK: - App Entry Point
@main
struct LEP_IOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - Main Container View
struct ContentView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        VStack(spacing: 0) {
            Picker("Select Screen", selection: $selectedTab) {
                Text("Blood Sugar").tag(0)
                Text("Medication").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 24)
            .padding(.top, 12)
            .padding(.bottom, 8)
            .background(Color.bgMint)

            TabView(selection: $selectedTab) {
                BloodSugarLogView()
                    .tag(0)

                MedicationScannerView()
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .background(Color.bgMint)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
