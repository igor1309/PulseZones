//
//  ExpandingText.swift
//  PulseZones
//
//  Created by Igor Malyarov on 08.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ExpandingText : View {
    var text: String
    var showExpandCollapseButtons: Bool
    
    //    @State private var showModal = false
    @State private var showFullDescription = false
    
    var body: some View {
        Button(action: {
            self.showFullDescription.toggle()
        }) {
            VStack(alignment: .leading) {
//                Text(text)
//                    .foregroundColor(.secondary)
//                    .font(.footnote)
                ExplanationText(name: text)
                    .lineLimit(showFullDescription ? nil : 3)
                
                if showExpandCollapseButtons {
                    Text(showFullDescription ? "свернуть⌃" : "полностью")
                        .font(.footnote)
                        .foregroundColor(.accentColor)
                        .opacity(0.7)
                }
            }
        }
    }
}

#if DEBUG
struct ExpandingText_Previews : PreviewProvider {
    static var previews: some View {
        Form {
            ExpandingText(text: "60-70% от МЧСС. Норма при ЧСС 120-135 уд/мин. Тренировки в этой зоне способствуют повышению общей выносливости. Как показывают исследования, при тренировке в этой зоне вы обеспечиваете мобилизацию жиров и транспорт жиров в мышцы. Повышается качество мышечных волокон и плотность капилляров. Тренировка во второй зоне является неотъемлемой частью программы занятий каждого бегуна. При тренировке в этой зоне также сжигается 85% жиров, 10% углеводов и 5% белков. Увеличивается общее количество сожженных калорий по сравнению с предыдущей зоной. Улучшение состояния сердечно-сосудистой и дыхательной системы.", showExpandCollapseButtons: false)
            
            ExpandingText(text: "60-70% от МЧСС. Норма при ЧСС 120-135 уд/мин. Тренировки в этой зоне способствуют повышению общей выносливости. Как показывают исследования, при тренировке в этой зоне вы обеспечиваете мобилизацию жиров и транспорт жиров в мышцы. Повышается качество мышечных волокон и плотность капилляров. Тренировка во второй зоне является неотъемлемой частью программы занятий каждого бегуна. При тренировке в этой зоне также сжигается 85% жиров, 10% углеводов и 5% белков. Увеличивается общее количество сожженных калорий по сравнению с предыдущей зоной. Улучшение состояния сердечно-сосудистой и дыхательной системы.", showExpandCollapseButtons: false)
//                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraLarge)
            
        }
        //        .previewLayout(.sizeThatFits)
    }
}
#endif
