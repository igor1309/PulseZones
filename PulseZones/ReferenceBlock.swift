//
//  ReferenceBlock.swift
//  PulseZones
//
//  Created by Igor Malyarov on 07.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ReferenceBlock : View {
    var zone: Zone
    
    var showFullDescription = false
    
    var body: some View {
        Section(header: HStack {
            Image(systemName: "heart.fill")
//                .imageScale(.large)
                .foregroundColor(zone.color)
//                .shadow(radius: 4)

//            Button(action: {}) {
//                Text("")
//            }
//                .padding(12)
//                .background(zone.color)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                .shadow(radius: 6)

            Text("\(zone.id). \(zone.name)".uppercased())
                .padding(.vertical, 8)
        }
        ) {
            //TODO:_ доделать!!! 180 это placeholder — на самом деле это должно быть вычисляемое значение МЧСС!!!!
            Text("Интервал ЧСС: \(Int(180 * zone.min))" + " — " + "\(Int(180 * zone.max))")
            
            VStack(alignment: .leading) {
                Text(zone.description)
                    .color(.secondary)
                    .font(.footnote)
                    .italic()
                    .lineLimit(showFullDescription ? nil : 3)
                
                Button(action: {
                    //TODO:_ доделать!!!
//                    showFullDescription.toggle()
                }) {
                    Text(showFullDescription ? "⌃" : "more")
                        .color(.accentColor)
                        .font(.footnote)
                }
//                    .tapAction { self.showFullDescription.toggle() }
            }
        }
    }
}

#if DEBUG
struct ReferenceBlock_Previews : PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return List {
            ReferenceBlock(zone: userData.zones[1])
                .previewLayout(.sizeThatFits)
        }
    }
}
#endif
