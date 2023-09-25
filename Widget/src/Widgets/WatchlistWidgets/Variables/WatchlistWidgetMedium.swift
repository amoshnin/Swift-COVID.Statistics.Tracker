import SwiftUI
import WidgetKit

struct WatchlistWidgetMedium: View {
    var entry: WatchlistStatsTimelineEntry
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1176470588, green: 0.1098039216, blue: 0.1058823529, alpha: 1))
            LazyHGrid (
                rows: [GridItem(.adaptive(minimum:.infinity) )]
            ) {
                ForEach(entry.countryCases.prefix(4), id: \.country) { countryCase in
                    Link(destination: countryCase.country.url, label: {
                        if let caseStats = countryCase.caseStats {
                            WatchlistWidgetRow(country: countryCase.country, caseStats: caseStats)
                        }
                    })
                    
                }
            }
            .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
         
          
        }
    }
}

struct WatchlistWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistWidgetMedium(entry: .stub)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
