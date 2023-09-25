 import SwiftUI
import WidgetKit

 let confirmedColor = Color.orange
 let deathColor = Color.red
 let recoveredColor = Color.green
let sickColor = Color(red: 253/255, green: 131/255, blue: 68/255)

struct CaseStatView: View {
    
    let text: String
    let totalCountText: String
    let color: Color
    var height: CGFloat? = nil
    
    var body: some View {
        VStack {
            Text(totalCountText).font(.system(size: 16, weight: .semibold))
            Text(text).font(.system(size: 12, weight: .regular))
        }
        .lineLimit(1)
        .minimumScaleFactor(0.7)
        .foregroundColor(.white)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: height)
        .background(color)
    }
}

struct CaseStatView_Previews: PreviewProvider {
    static var previews: some View {
        CaseStatView(text: "Confirmed", totalCountText: "400", color: .green, height: nil)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
