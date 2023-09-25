import SwiftUI

struct TypePickerView: View {
    @Binding var selectedType: CountryListRow.CountryStatEnum

    var body: some View {
            Picker(selection: $selectedType, label: Text("Position")) {
                ForEach(CountryListRow.CountryStatEnum.allCases, id: \.self) {
                    switch $0 {
                    case .recovered:
                        Text("Recovered")
                    case .sick:
                        Text("Sick now")
                    case .deaths:
                        Text("Deaths")
                    }
                }
                
            }.pickerStyle(SegmentedPickerStyle())
        }
 
}
 
