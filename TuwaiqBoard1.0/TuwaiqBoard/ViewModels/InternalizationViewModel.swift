//
//  InterilizationViewModel.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 9/4/23.
//

import Foundation


// internalization
//
//class InternalizationViewModel : ObservableObject {
//    @Published var currentLanguageIsEnglish: Bool = true

//var englishDictionary: Dictionary<String, String> = .init()
//var arabicDictionary: Dictionary<String, String> = .init()
//
//init(){
//    if let arJSON = try? String(contentsOfFile: "ar.json") {
//        print(ar)
//    }
//    
//}
//
//
//}







// language switch in more page
//    @EnvironmentObject var internalization: InternalizationViewModel
//
//    HStack{
//        if internalization.currentLanguageIsEnglish{
//            Toggle("Current lang: eng", isOn: $internalization.currentLanguageIsEnglish)
//
//        } else {
//            Toggle("اللغه الحاليه: عربي", isOn: $internalization.currentLanguageIsEnglish)
//                .pref
//        }
//    }
//    .environment(\.layoutDirection,
//        internalization.currentLanguageIsEnglish ?
//        .leftToRight : .rightToLeft)
//
    




//@main app
//@ObservedObject var internalization: InternalizationViewModel
