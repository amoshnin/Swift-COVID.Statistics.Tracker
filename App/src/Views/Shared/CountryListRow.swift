import SwiftUI

struct CountryListRow: View {
    @Binding var selectedType: CountryStatEnum
    var country: CaseStats
    
    enum CountryStatEnum: String, CaseIterable {
        case recovered
        case sick
        case deaths
    }
    
    var body: some View {
        HStack {
            Text(country.country.displayName.prefix(16))
            Spacer()
            switch selectedType {
            case .recovered:
                HStack {
                    Text(country.totalCaseCount.recoveredText)
                    Text("+\(country.newRecovered)")
                        .foregroundColor(.green)
                        .font(.footnote)
                }
            case .sick:
                HStack {
                    Text(country.totalCaseCount.sickText)
                    Text("+\(country.newConfirmed)")
                        .foregroundColor(.orange)
                        .font(.footnote)
                }
            case .deaths:
                HStack {
                    Text(country.totalCaseCount.deathText)
                    Text("+\(country.newDeaths)")
                        .foregroundColor(.red)
                        .font(.footnote)
                }
            }
        }
    }
}
 
