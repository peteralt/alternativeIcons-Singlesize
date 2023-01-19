import SwiftUI

struct ContentView: View {
    var logoClient: LogoClient
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Alternative App Icons")) {
                    ForEach(logoClient.availableIcons()) { icon in
                        Button(action: {
                            logoClient.setIcon(icon)
                        }) {
                            HStack {
                                Image(uiImage: icon.icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60)
                                    .cornerRadius(12)
                                Text(icon.title)
                            }
                        }
                        .foregroundColor(Color(UIColor.label))
                    }
                }
                
                Section {
                    Button(action: {
                        logoClient.resetIcon()
                    }) {
                        Text("Reset to default App Icon")
                    }
                }
            }
            .navigationTitle("App Icons")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(logoClient: .samples)
    }
}
