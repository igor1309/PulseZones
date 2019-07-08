//
//  UserData.swift
//  PulseZones
//
//  Created by Igor Malyarov on 08.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: BindableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showInReverseOrder = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var zones = zoneData {
        didSet {
            didChange.send(self)
        }
    }
}
