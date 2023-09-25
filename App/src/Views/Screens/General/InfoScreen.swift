import SwiftUI

struct InfoScreen: View {
    
    var body: some View {
        NavigationView {
            GeometryReader { bounds in
                
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("Symptoms")
                            .font(.title)
                            .padding(.horizontal)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            let BLOCK_SIZE: CGFloat = 140
                            
                            HStack {
                                ForEach(InfoData().SymptomsData) { item in
                                    GeometryReader { geometry in
                                        SymptomBlockView(size: BLOCK_SIZE, symptom: item)
                                            .rotation3DEffect(.degrees(Double(geometry.frame(in: .global).minX - 30) / -getAngleMultiplier(bounds:bounds)), axis: (x: 0, y: 10, z: 0))
                                    }
                                    .frame(width: BLOCK_SIZE, height: BLOCK_SIZE)
                                }
                                .padding(.bottom, 60)
                                .padding(.top, 10)
                                
                            }
                            .padding(.horizontal)
                            
                        }
                        .offset(y: -5)
                        
                        
                        .padding(.bottom, 25)
                        
                        
                        Group {
                            Text("Recommendations")
                                .font(.title)
                                .padding(.bottom, 5)
                            VStack {
                                ForEach (InfoData().RecommendationsData) { item in
                                    RecommendationRowView(recommendation: item)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .offset(y: -50)
                        
                        
                    }
                    .navigationTitle("Information")
                }
            }
        }
        
    }
    
    private func getAngleMultiplier(bounds: GeometryProxy) -> Double {
        if bounds.size.width > 500 { return 80}
        else { return 20 }
    }
}

struct SymptomBlockView: View {
    var size: CGFloat
    var symptom: SymptomModel
    
    var body: some View {
        VStack (spacing: 10) {
            Text(symptom.icon)
                .font(.largeTitle)
            
            
            Text(symptom.title)
        }
        .padding()
        .frame(width: size, height: size)
        .background(symptom.color)
        .cornerRadius(BLOCK_CORNER_RADIUS)
        .shadow(color: symptom.color.opacity(0.45), radius: 20, x: 0, y: 20)
    }
    
    private let BLOCK_CORNER_RADIUS: CGFloat = 10
}

struct RecommendationRowView: View {
    var recommendation: RecommendationModel
    
    var body: some View {
        HStack (alignment: .top) {
            Text(recommendation.icon)
                .padding()
                .background(Color.red)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.trailing)
            
 
            
            VStack (alignment: .leading) {
                Text(recommendation.title)
                Text(recommendation.subtitle)
            }
        }
        .padding()
        .background(Color("card"))
        .cornerRadius(6)
        .padding(.vertical, 5)
        
    }
}

struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen( )
        
        
    }
}




