//
//  Zones.swift
//  PulseZones
//
//  Created by Igor Malyarov on 07.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct Zone : Identifiable {
    var id: Int
    var name: String
    var description: String
    var color: Color        //   ZoneColor
    var min: Double
    var max: Double
    
//    enum ZoneColor {
//        case red, blue, yellow, green, white
//    }
}
