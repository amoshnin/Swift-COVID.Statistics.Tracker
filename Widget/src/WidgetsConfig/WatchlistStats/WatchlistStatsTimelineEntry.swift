import WidgetKit

struct WatchlistStatsTimelineEntry: TimelineEntry {
    public let date: Date
    public let countryCases: [(country: Country, caseStats: CaseStats?)]
    public var isPlaceholder = false
}

extension WatchlistStatsTimelineEntry {

    static var stub: WatchlistStatsTimelineEntry {
        .init(date: Date(), countryCases: [
            (Country(id: "japan", name: "Japan", iso: "JP"), .stub),
            (Country(id: "oman", name: "Oman", iso: "OM"), .stub),
            (Country(id: "singapore", name: "Singapore", iso: "SG"), .stub),
            (Country(id: "indonesia", name: "Indonesia", iso: "ID"), .stub),
            (Country(id: "indonedsadssia", name: "Inddsadsaonesia", iso: "IdsadaD"), .stub),
            (Country(id: "spain", name: "Spain", iso: "ID"), .stub),
            (Country(id: "germany", name: "Germany", iso: "ID"), .stub)
        ])
    }
    
    static var placeholder: WatchlistStatsTimelineEntry {
        var stub = WatchlistStatsTimelineEntry.stub
        stub.isPlaceholder = true
        return stub
    }
}
