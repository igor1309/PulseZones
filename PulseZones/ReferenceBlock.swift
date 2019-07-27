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
            }
        ) {
            Text("ЧСС: \(Int(Double(userData.maxPulse) * zone.min))" + " – " + "\(Int(Double(userData.maxPulse) * zone.max))")
                .font(.callout)
            
            ExpandingText(text: zone.description, showExpandCollapseButtons: false)
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
