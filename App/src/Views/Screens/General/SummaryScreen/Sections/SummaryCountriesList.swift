import SwiftUI

struct SummaryCountriesList: View {
    @EnvironmentObject var dailySummary: DailySummaryViewModel
    
    @State var selectedType: CountryListRow.CountryStatEnum = .recovered
    @State var search: String = ""
    
    var body:  some View {
        Section() {
            TypePickerView(selectedType: $selectedType)
            CountriesListView
        }
        .padding(.top)
        .padding(.bottom, 10)
    }
    
    private var CountriesListView: some View {
        Group {
            ForEach (dailySummary.limitedCountries) { item in
                NavigationLink(
                    destination: CountryDetailScreen(country: item.country),
                    label: {
                        CountryListRow(selectedType: $selectedType, country: item)
                    })
            }
            
            NavigationLink(
                destination: SearchCountriesScreen(),
                label: {
                    HStack {
                        Spacer()
                        Image(systemName: "list.dash")
                        Text("All countries")
                        Spacer()
                    }
                    .foregroundColor(.primary)
                }
            )
        }
        
    }
}

struct SummaryCountriesList_Previews: PreviewProvider {
    static var previews: some View {
        SummaryCountriesList()
    }
}
