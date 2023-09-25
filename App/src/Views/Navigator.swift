import SwiftUI
import WidgetKit

struct Navigator: View {
    @State var selectedCountry: Country?
    @State var selection: String = "summary"
    
    var body: some View {
        TabView(selection: $selection) {
            SummaryScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "chart.bar")
                        Text("Summary")
                    }
                }
                .tag("summary")
            
            WatchlistScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Watchlist")
                    }
                }
                .tag("watchlist")
            
            InfoScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "info.circle.fill")
                        Text("Info")
                    }
                }
                .tag("watchlist")
            
        }
        .sheet(item: $selectedCountry, onDismiss: { selectedCountry = nil }, content: { (country) in
            NavigationView { CountryDetailScreen(country: country)}
        })
        .onOpenURL(perform: { url in
            self.selection = url.host ?? "summary"
            guard let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems else {
                self.selectedCountry = nil
                return
            }
            
            var dict = [String: String]()
            queryItems.forEach { (item) in
                dict[item.name] = item.value
            }
            guard let id = dict["id"], let name = dict["name"], let iso = dict["iso"] else {
                self.selectedCountry = nil
                return
            }
            self.selectedCountry = Country(id: id, name: name, iso: iso)
        })
    }
}

struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
            .environmentObject(WatchlistViewModel())
            .environmentObject(DailySummaryViewModel())
    }
}
