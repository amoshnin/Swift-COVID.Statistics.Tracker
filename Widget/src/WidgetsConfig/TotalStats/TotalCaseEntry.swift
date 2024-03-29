import Foundation
import WidgetKit

struct TotalCaseEntry: TimelineEntry {
    public let date: Date
    public let totalCount: TotalCaseCount
    public var isPlaceholder = false
    
    public var url: URL? = nil
}

extension TotalCaseEntry {
    static var stub: TotalCaseEntry { TotalCaseEntry(date: Date(), totalCount: .init(title: "USA", confirmed: 300, death: 100, recovered: 100)) }
    static var placeholder: TotalCaseEntry { TotalCaseEntry(date: Date(), totalCount: .init(title: "----", confirmed: 1000, death: 1000, recovered: 1000), isPlaceholder: true) }
}
