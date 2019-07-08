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
    @State private var showFullDescription = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .color(.secondary)
                .font(.footnote)
                .italic()
                .lineLimit(showFullDescription ? nil : 3)
            
            Button(action: {
                self.showFullDescription.toggle()
            }) {
                Text(showFullDescription ? "⌃" : "more")
                    .color(.accentColor)
                    .font(.footnote)
            }
            //                    .tapAction { self.showFullDescription.toggle() }
        }
    }
}

#if DEBUG
struct ExpandingText_Previews : PreviewProvider {
    static var previews: some View {
        ExpandingText(text: "60-70% от МЧСС. Норма при ЧСС 120-135 уд/мин. Тренировки в этой зоне способствуют повышению общей выносливости. Как показывают исследования, при тренировке в этой зоне вы обеспечиваете мобилизацию жиров и транспорт жиров в мышцы. Повышается качество мышечных волокон и плотность капилляров. Тренировка во второй зоне является неотъемлемой частью программы занятий каждого бегуна. При тренировке в этой зоне также сжигается 85% жиров, 10% углеводов и 5% белков. Увеличивается общее количество сожженных калорий по сравнению с предыдущей зоной. Улучшение состояния сердечно-сосудистой и дыхательной системы.")
        .previewLayout(.sizeThatFits)
    }
}
#endif