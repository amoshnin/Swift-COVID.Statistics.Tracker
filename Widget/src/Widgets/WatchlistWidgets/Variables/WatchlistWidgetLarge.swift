import SwiftUI
import WidgetKit

struct WatchlistWidgetLarge: View {
    var entry: WatchlistStatsTimelineEntry
    
    var body: some View {
        ZStack  {
            Color(#colorLiteral(red: 0.1176470588, green: 0.1098039216, blue: 0.1058823529, alpha: 1))
            LazyHGrid (
                rows: [GridItem(.adaptive(minimum:.infinity)),GridItem(.adaptive(minimum:.infinity))]
            ) {
                ForEach(entry.countryCases.prefix(5), id: \.country) { countryCase in
                    Link(destination: countryCase.country.url, label: {
                        if let caseStats = countryCase.caseStats {
                            WatchlistWidgetRow(country: countryCase.country, caseStats: caseStats)
                        } else {
                            Text(countryCase.country.displayName)
                        }
                    })
                }
            }
            .padding(.bottom, 10)
        }
        .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
        
    }
}

struct WatchlistWidgetLarge_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistWidgetLarge(entry: .stub)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
