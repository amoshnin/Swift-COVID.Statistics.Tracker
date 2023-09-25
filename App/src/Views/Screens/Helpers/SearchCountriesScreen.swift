import SwiftUI

struct SearchCountriesScreen: View {
    @EnvironmentObject var dailySummary: DailySummaryViewModel
    @State var selectedType: CountryListRow.CountryStatEnum = .recovered
    @State var searchText: String = ""
    
    var body: some View {
             ZStack {
                if let countries = dailySummary.stats?.countries {
                    VStack {
                        SearchBar(text: $searchText, placeholder: "Search")
                        TypePickerView(selectedType: $selectedType)
                            .padding(.horizontal)
                            .padding(.vertical, 5)

                        List(countries.filter({ (caseStat) -> Bool in
                            if searchText == "" {
                                return true
                            } else {
                                return caseStat.country.name.lowercased().contains(searchText.lowercased())
                            }
                        })) { caseStat in
                            NavigationLink(
                                destination: CountryDetailScreen(country: caseStat.country),
                                label: {
                                    CountryListRow(selectedType: $selectedType, country: caseStat)
                                })
                            
                        }
                        .listStyle(PlainListStyle())
                    }
                    
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Search Country")
             .onAppear { dailySummary.fetchSummary()}

        }
         
        
        
 }

 
