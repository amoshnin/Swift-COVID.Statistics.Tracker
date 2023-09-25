import SwiftUI

class DailySummaryViewModel: NSObject, ObservableObject {
    @Published var stats: DailySummaryCaseStats?
    @Published var limitedCountries: [CaseStats] = [CaseStats]()
    
    @Published var isLoading = false
    @Published var error: Error?
    
    let service: RepositoryService
    
    init(service: RepositoryService = APIService.shared) {
        self.service = service
    }
    
    func fetchSummary() {
        isLoading = true
        error = nil
        
        service.getDailySummaryStats { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let stats):
                self.stats = stats

                let countries = stats.countries.sorted(by: { $0.totalConfirmed > $1.totalConfirmed })
                self.limitedCountries = Array(countries.prefix(upTo: 10))
            case .failure(let error):
                self.error = error
            }
        }
    }
}
