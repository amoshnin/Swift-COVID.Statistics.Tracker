import WidgetKit
import SwiftUI

struct StatsWidget: Widget {
    private let kind: String = "Covid19StatsWidget"
    
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectCountryIntent.self, provider: TotalStatsIntentTimelineProvider(), content: { (entry) in
            StatsWidgetIndex(entry: entry)
                .widgetURL(entry.url)
        })
        .configurationDisplayName("Covid19-Stats")
        .description("Show latest lifetime total stats")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct WatchlistStatsWidget: Widget {
    
    private let kind: String = "WatchlistStatsWidget"
    
    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WatchlistStatsTimelineProvider(), content: { (entry)  in
            WatchlistWidgetIndex(entry: entry)
        })
        .configurationDisplayName("Covid19-Stats Watchlist")
        .description("Show watchlist countries daily and lifetime stats")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

@main
struct Index: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        StatsWidget()
        WatchlistStatsWidget()
    }
}
