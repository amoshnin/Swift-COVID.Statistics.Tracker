import SwiftUI
import WidgetKit

struct CasePieChart: View {
    let totalCount: TotalCaseCount
    let date: Date
    
    var body: some View {
        HStack {
            PieChartView(
                data: [(Double(totalCount.sick), sickColor), (Double(totalCount.death), deathColor), (Double(totalCount.recovered), recoveredColor)],
                form: CGSize(width: 180, height: 160)
            )
            
            VStack(spacing: 16) {
                VStack(spacing: 2) {
                    Text(totalCount.title)
                        .font(.system(size: 30, weight: .semibold))
                    Text(date, style: .time)
                        .font(.system(size: 12, weight: .semibold))
                }
                
                VStack {
                    Text(totalCount.recoveryRateText ).font(.system(size: TITLE_FONT_SIZE, weight: .semibold)).foregroundColor(recoveredColor)
                    Text("Recovery Rate").font(.system(size: SUBTITLE_FONT_SIZE, weight: .regular))
                }
                
                
                VStack {
                    Text(totalCount.fataliityRateText ).font(.system(size: TITLE_FONT_SIZE, weight: .semibold)).foregroundColor(deathColor)
                    Text("Fatality Rate").font(.system(size: SUBTITLE_FONT_SIZE, weight: .regular))
                }
            }
            .minimumScaleFactor(0.7)
            .lineLimit(1)
            .padding(.trailing)
        }
        .padding()
    }
    
    private let TITLE_FONT_SIZE: CGFloat = 28
    private let SUBTITLE_FONT_SIZE: CGFloat = 12
}

struct CasePieChart_Previews: PreviewProvider {
    static var previews: some View {
        CasePieChart(totalCount: .init(title: "USA", confirmed: 300, death: 100, recovered: 100), date: Date())
            .previewContext(WidgetPreviewContext(family: .systemLarge)
            )
    }
}
