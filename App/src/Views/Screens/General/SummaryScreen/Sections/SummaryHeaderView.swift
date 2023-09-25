import SwiftUI

struct SummaryHeaderView: View {
    @EnvironmentObject var dailySummary: DailySummaryViewModel
    
    var body:  some View {
        Section(header: Text("Global Lifetime Stats")) {
            let stats  = dailySummary.stats
            Text(stats!.date, style: .date)
                .font(.headline)
            
            CasePieChart(totalCount: stats!.global.totalCaseCount, date: Date())
            CaseStatGrid(totalCount: stats!.global.totalCaseCount)
                .frame(height: HEIGHT)
                .cornerRadius(8)
                .padding(.vertical)
        }
    }
    
    private let HEIGHT: CGFloat = 140
}

struct SummaryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryHeaderView()
    }
}
