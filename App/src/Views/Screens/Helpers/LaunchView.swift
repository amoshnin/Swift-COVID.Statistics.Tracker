
import SwiftUI

struct LaunchView: View {
    @AppStorage("didLaunch") var didLaunch: String = "false"

    var body: some View {
        VStack {
            Image("LaunchImg")
                .resizable()
                .frame(width: .infinity)
          
            Spacer()
            
            VStack (alignment: .leading) {
               VStack (alignment: .leading) {
                    Text("Be aware")
                    Text("Stay healthy")
                }
                .font(.title)
               .padding(.bottom)
               
                
                Text("Welcome to COVID-19 information portal")
                    .font(.subheadline)
                Text("by Artem Moshnin")
                    .font(.footnote)
                Spacer()
                HStack {
                    Spacer()
                    Text("Get started")
                   
                    Button(action: {self.didLaunch = "true"}, label: {
                        Image(systemName: "arrow.right")
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                Circle()
                                    .foregroundColor(Color(#colorLiteral(red: 0.568627451, green: 0.3411764706, blue: 0.9254901961, alpha: 1))))
                    })
                }
            }
            .offset(y: -10)
            .frame(height: 240)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white).offset(y: -25))

        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct LaunchViews_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
