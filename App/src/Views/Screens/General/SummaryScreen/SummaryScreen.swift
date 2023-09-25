import SwiftUI

struct SummaryScreen: View {
    @EnvironmentObject var dailySummary: DailySummaryViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if (dailySummary.stats != nil) {
                    List {
                        SummaryHeaderView()
                        SummaryCountriesList()
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                } else {
                    ProgressView()
                }
            }
            .navigationTitle(LocalizedStringKey("DailySummary"))
        }
        .onAppear { dailySummary.fetchSummary()}
    }

 
}

struct SummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        SummaryScreen()
            .preferredColorScheme(.dark)
            .environmentObject(DailySummaryViewModel())
    }
}


