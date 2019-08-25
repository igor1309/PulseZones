//
//  ZoneList.swift
//  PulseZones
//
//  Created by Igor Malyarov on 08.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ZoneList : View {
    @EnvironmentObject private var userData: UserData

    var body: some View {
        
        let keys = userData.terms.map { $0.key }
        let values = userData.terms.map { $0.value }
        
        return List {
            ForEach(keys.indices) { index in
                Terms(term: keys[index], definition: values[index])
            }
        }
    }
}

#if DEBUG
struct ZoneList_Previews : PreviewProvider {
    static var previews: some View {
        ZoneList()
            .environmentObject(UserData())
    }
}
#endif
