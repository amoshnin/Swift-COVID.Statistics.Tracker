import SwiftUI

struct WatchlistScreen: View {
    @EnvironmentObject var watchlist: WatchlistViewModel
    @EnvironmentObject var dailySummary: DailySummaryViewModel
    @State var selectedCountry: Country?
    
    private func countryStat(with country: Country) -> CaseStats? {
        guard let watchlist = dailySummary.stats?.countries else {
            return nil
        }
        return watchlist.first { country.id == $0.id }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(watchlist.watchlist) { country in
                    NavigationLink(
                        destination: CountryDetailScreen(country: country),
                        label: {
                            if let countryStat = countryStat(with: country) {
                                CountryRow(countryStat: countryStat, isAddedToWatchlist: watchlist.isAddedToWatchlist(country: country))
                                    .padding(.vertical)
                            } else {
                                Text(country.displayName)
                            }
                        })
                }
                .onDelete(perform: delete(at:))
                .onMove(perform: move(indices:newOffset:))
            }
            .navigationBarItems(trailing: EditButton())
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Watchlist")
        }
    }
    
    func delete(at offsets: IndexSet) {
        offsets.forEach { (index) in
            let country = watchlist.watchlist[index]
            watchlist.toggle(country: country)
        }
     }
    
    func move(indices: IndexSet, newOffset: Int) {
        watchlist.move(indices: indices, newOffset: newOffset)

    }
}

struct WatchlistScreen_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistScreen()
            .environmentObject(WatchlistViewModel())
            .environmentObject(DailySummaryViewModel())
    }
}
