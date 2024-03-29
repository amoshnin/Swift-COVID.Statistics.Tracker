import Foundation
import WidgetKit

struct TotalStatsIntentTimelineProvider: IntentTimelineProvider {
    typealias Entry = TotalCaseEntry
    typealias Intent = SelectCountryIntent
    
    let service = APIService.shared
    
    func placeholder(in context: Context) -> TotalCaseEntry {
        .placeholder
    }
    
    func getSnapshot(for configuration: SelectCountryIntent, in context: Context, completion: @escaping (TotalCaseEntry) -> Void) {
        if context.isPreview {
            completion(.placeholder)
        } else {
            fetchTotalCaseStats(for: configuration.country ?? CountryParam.global) { (result) in
                switch result {
                case .success(let entry):
                    completion(entry)
                    
                case .failure(_):
                    completion(.placeholder)
                }
            }
        }
    }
    
    func getTimeline(for configuration: SelectCountryIntent, in context: Context, completion: @escaping (Timeline<TotalCaseEntry>) -> Void) {
        fetchTotalCaseStats(for: configuration.country ?? CountryParam.global) { (result) in
            switch result {
            case .success(let entry):
                let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 10)))
                completion(timeline)
                
            case .failure(_):
                let timeline = Timeline(entries: [TotalCaseEntry.placeholder], policy: .after(Date().addingTimeInterval(60 * 2)))
                completion(timeline)
            }
        }
    }
    
    private func fetchTotalCaseStats(for param: CountryParam, completion: @escaping (Result<TotalCaseEntry, Error>) -> ()) {
        guard let id = param.identifier else {
            completion(.failure(APIError.noData))
            return
        }
        
        switch id {
        case CountryParam.global.identifier:
            service.getGlobalTotalCount { (result) in
                switch result {
                case .success(let stats):
                    let totalCaseEntry = TotalCaseEntry(date: Date(), totalCount: .init(title: "🌏", confirmed: stats.totalConfirmed, death: stats.totalDeaths, recovered: stats.totalRecovered), url: URL(string: "stats://summary"))
                    completion(.success(totalCaseEntry))
                    
                case .failure(let error):
                    completion(.failure(error))
                
                }
            }
            
        default:
            service.getTotalCount(countryId: id) { (result) in
                switch result {
                case .success(let totalCase):
                    let totalCaseEntry = TotalCaseEntry(date: Date(), totalCount: .init(title: param.iso?.flag ?? param.displayString, confirmed: totalCase.confirmed, death: totalCase.deaths, recovered: totalCase.recovered), url: URL(string: "stats://watchlist?id=\(id)&name=\(totalCase.country)&iso=\(param.iso ?? "")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!))
                    completion(.success(totalCaseEntry))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
                
            }
        }
    }
    
}
