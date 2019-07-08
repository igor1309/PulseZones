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
    
    //  Обобщенная формула подсчета МЧСС: 220 минус ваш возраст. Более современная формула: 214-(0.8 x возраст) для мужчин и 209-(0.9 x возраст) для женщин. Но более информативным будет получить значение в лабораторных условиях.
    var maxPulse: Int {
        return Int(( gender == 1) ?
            Int(214 - (0.8 * age)) :
            Int(209 - (0.90 * age)))
    }
    
    //  TODO: сохраняемый и загружаемый параметр
    //  TODO: идентифицировать пол числом — это плохо
    var gender = 1 {
        didSet {
            didChange.send(self)
        }
    }

    //  TODO: сохраняемый и загружаемый параметр
    var age = 48.0 {
        didSet {
            didChange.send(self)
        }
    }
    
    var showInReverseOrder = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var terms = zoneTerms {
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
