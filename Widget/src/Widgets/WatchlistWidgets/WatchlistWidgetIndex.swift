import SwiftUI
import WidgetKit

struct WatchlistWidgetIndex: View {
    var entry: WatchlistStatsTimelineEntry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        ZStack {
            if entry.countryCases.isEmpty {
                Link(destination: URL(string: "stats://search")!, label: {
                    Text("Add countries to watchlist from the App")
                        .foregroundColor(Color(UIColor.systemBlue))
                        .padding()
                })
            } else {
                switch family {
                case .systemLarge:
                    WatchlistWidgetLarge(entry: entry)
                default:
                    WatchlistWidgetMedium(entry: entry)
                }
            }
        }
    }
}

struct WatchlistWidgetIndex_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WatchlistWidgetIndex(entry: .stub)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            WatchlistWidgetIndex(entry: .stub)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}

