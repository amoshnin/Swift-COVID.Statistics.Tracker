import SwiftUI
import WidgetKit

struct StatsWidgetIndex : View {
    var entry: TotalCaseEntry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemSmall:
            StatsWidgetSmall(entry: entry)
        case .systemLarge:
            StatsWidgetLarge(entry: entry)
        default:
            StatsWidgetMedium(entry: entry)
        }
    }
}

struct StatsWidgetIndex_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatsWidgetIndex(entry: TotalCaseEntry.stub)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .environment(\.colorScheme, .dark)
        }
    }
}
