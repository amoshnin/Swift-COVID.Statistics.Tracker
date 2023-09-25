import SwiftUI

@main
struct Index: App {
    @StateObject var watchlist = WatchlistViewModel()
    @StateObject var dailySummary = DailySummaryViewModel()
    @AppStorage("didLaunch") var didLaunch: String = "false"

    var body: some Scene {
        WindowGroup {
            if didLaunch == "false" {
                LaunchView()
            } else {
                Navigator()
                    .environmentObject(watchlist)
                    .environmentObject(dailySummary)
            }
        }
    }
}

