import SwiftUI
import WidgetKit

struct StatsWidgetMedium: View {
    
    let entry: TotalCaseEntry
    
    var body: some View {
        VStack(spacing: 0) {
            TitleHeader(title: entry.totalCount.title, date: entry.date)
                .padding(.vertical, 4)
                .padding(.horizontal)
            CaseStatGrid(totalCount: entry.totalCount)
        }
        .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
    }
}

struct StatsWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        StatsWidgetMedium(entry: TotalCaseEntry.placeholder)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
