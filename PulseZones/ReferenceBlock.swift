//
//  ReferenceBlock.swift
//  PulseZones
//
//  Created by Igor Malyarov on 07.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ReferenceBlock : View {
    @EnvironmentObject private var userData: UserData

    var zone: Zone
    
    var body: some View {
        Section(header: HStack {
            Image(systemName: "heart.fill")
                .foregroundColor(zone.color)
                .imageScale(.small)

            Text("\(zone.id). \(zone.name)".uppercased())
                //  MARK:- если выяснить как доставать значение .environment.colorScheme
                //  и делать сравнение типа (.colorScheme == .dark)
                //  то можно сделать что-то вроде
                //  .color(.environment.colorScheme == .dark ? zone.color : Color(.gray))
                //  только правильно(!!) и вместо Color(.gray) цвет по умолчанию (как его доставать? это .primary?)
                //  в темном варианте цвета хэдеров секций выглядят норм
                .padding(.vertical, 8)
        }
        ) {
            Text("ЧСС: \(Int(Double(userData.maxPulse) * zone.min))" + " – " + "\(Int(Double(userData.maxPulse) * zone.max))")
                .font(.callout)
            
            ExpandingText(text: zone.description)
//                .font(.headline)
        }
    }
}

#if DEBUG
struct ReferenceBlock_Previews : PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return List {
            ReferenceBlock(zone: userData.zones[1])
                .environmentObject(UserData())
                .previewLayout(.sizeThatFits)
        }
    }
}
#endif
