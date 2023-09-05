import SwiftUI

struct BootcampDetailsView: View {

 
    @State private var selectedOption = 0

    var body: some View {
        NavigationView {
            VStack {
                
                // Header
                ZStack {
                    Color(red: 0.3608, green: 0.2157, blue: 0.5882)
                        .frame(height: 260)

                    HStack {
                        Button(action: {


                        }) {
                            Image(systemName: "xmark")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {


                        }) {
                            Image(systemName: "message.fill")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 130)
                    .padding(.horizontal)

                    HStack {
                        Text("Swift Bootcamp")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title)
                            .padding(.horizontal)
                        Spacer()
                    }
                        
                    // Horizontal Scrollable Options
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<optionNames.count, id: \.self) { index in
                                Button(action: {
                                    selectedOption = index
                                }) {
                                    VStack(spacing: 0) {
                                        Text(optionNames[index])
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.headline)
                                            .padding()
                                        if selectedOption == index {
                                            Text(" ")
                                                .frame(width: 90, height: 6)
                                                .background(Color.white)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.top, 203)
                        .padding(.horizontal)
                    }
                }

                // Display Selected Option Content
                selectedContent

                Spacer()
            }
            .ignoresSafeArea(.all, edges: .all)
        }
    }

    var optionNames = ["Agenda", "Instructors", "Assignments", "Grades", "Evaluation"]

    var selectedContent: some View {
        switch selectedOption {
        case 0:
            return AnyView(AgendaView())
        case 1:
            return AnyView(InstructorsView())
        case 2:
            return AnyView(AssignmentsView())
        case 3:
            return AnyView(GradesView())
        case 4:
            return AnyView(EvaluationView())
        default:
            return AnyView(AgendaView())
        }
    }
    
}




struct BootcampDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BootcampDetailsView()
    }
}
