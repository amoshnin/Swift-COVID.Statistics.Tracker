import SwiftUI
import WidgetKit

struct TitleHeader: View {
    let title: String
    let date: Date
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
            Text(date, style: .time)
                .font(.system(size: 12, weight: .semibold))
        }
        .lineLimit(1)
        .minimumScaleFactor(0.7)
    }
}

struct TitleHeader_Previews: PreviewProvider {
    static var previews: some View {
        TitleHeader(title: "USA", date: Date())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
