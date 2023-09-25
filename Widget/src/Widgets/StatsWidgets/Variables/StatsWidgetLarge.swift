import SwiftUI
import WidgetKit

struct StatsWidgetLarge: View {
    
    let entry: TotalCaseEntry
    
    var body: some View {
        VStack(spacing: 0) {
            CasePieChart(totalCount: entry.totalCount, date: entry.date)
            CaseStatGrid(totalCount: entry.totalCount)
        }
        .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
    }
}

struct StatsWidgetLarge_Previews: PreviewProvider {
    static var previews: some View {
        StatsWidgetLarge(entry: TotalCaseEntry.placeholder)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
