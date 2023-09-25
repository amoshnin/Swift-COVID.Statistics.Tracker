import SwiftUI
import WidgetKit

struct WatchlistWidgetRow: View {
    let country: Country
    let caseStats: CaseStats
    
    var body: some View {
        VStack (spacing: 7) {
            VStack {
                Text(country.displayName.prefix(1))
                    .font(.title)
              
                
                Text(country.displayName.dropFirst())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)   
            }
            
            WatchlistStatsNumber( totalCase: caseStats.newTotalCaseCount)
        }
        .frame(width: 92)
        .padding(.horizontal, 5)
      
    }
    
    private struct WatchlistStatsNumber: View {
        var totalCase: TotalCaseCount
        
        var body: some View {
            VStack {
                Text("Recovered") .foregroundColor(recoveredColor)
                Text(totalCase.recoveredText)
                   .foregroundColor(recoveredColor)
                   .fontWeight(.semibold)
                
                Text("Cofirmed") .foregroundColor(confirmedColor)
                Text(totalCase.confirmedText)
                    .foregroundColor(confirmedColor)
                    .fontWeight(.semibold)

                Text("Deaths") .foregroundColor(deathColor)
                 Text(totalCase.deathText)
                    .foregroundColor(deathColor)
                    .fontWeight(.semibold)
             }
            .font(.caption)
            
        }
    }
    
}



