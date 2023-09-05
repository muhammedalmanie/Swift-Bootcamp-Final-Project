import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = BootcampsViewModel()
    @State private var bootcamps: [Bootcamp] = []

    var body: some View {
        NavigationView {
            VStack {
                Button("Upload to Firestore") {
                    viewModel.uploadBootcampsToFirestore(bootcamps: bootcamps)
                    print("Loaded Bootcamps: \(bootcamps)")
                }
            }
            .onAppear {
                print("View appeared")
                print("Before loading bootcamps")
                bootcamps = viewModel.loadBootcampsFromJSON()
                print("After loading bootcamps")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
