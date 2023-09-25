import SwiftUI
import WidgetKit

struct StatsWidgetSmall: View {
    
    var entry: TotalCaseEntry
    
    var body: some View {
        VStack(spacing: 0) {
            TitleHeader(title: entry.totalCount.title, date: entry.date)
                .padding(.vertical, 4)
                .padding(.horizontal)
            
            CaseStatView(text: "Confirmed", totalCountText: entry.totalCount.confirmedText, color: confirmedColor)
            CaseStatView(text: "Deaths", totalCountText: entry.totalCount.deathText, color: deathColor)
            CaseStatView(text: "Recovered", totalCountText: entry.totalCount.recoveredText, color: recoveredColor)
        }
        .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
    }
}

struct StatsWidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        StatsWidgetSmall(entry: TotalCaseEntry.stub)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
