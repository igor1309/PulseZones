//
//  UserData.swift
//  PulseZones
//
//  Created by Igor Malyarov on 08.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Combine
import Foundation

final class UserData: ObservableObject {
    let willChange = PassthroughSubject<UserData, Never>()
    
    //  Обобщенная формула подсчета МЧСС: 220 минус ваш возраст. Более современная формула: 214-(0.8 x возраст) для мужчин и 209-(0.9 x возраст) для женщин. Но более информативным будет получить значение в лабораторных условиях.
    var maxPulse: Int {
        return Int(( gender == 1) ?
            Int(214 - (0.80 * age)) :
            Int(209 - (0.90 * age)))
    }
    
    private let defaults = UserDefaults.standard
    
    //  TODO: идентифицировать пол числом — это плохо
    @Published var gender = (UserDefaults.standard.integer(forKey: "gender")) {
        didSet {
//            willChange.send(self)
            defaults.set(gender, forKey: "gender")
        }
    }

    @Published var age = (UserDefaults.standard.double(forKey: "age")) == 0 ? 40 : (UserDefaults.standard.double(forKey: "age")) {
        didSet {
            defaults.set(age, forKey: "age")
        }
    }
    
    @Published var showInReverseOrder: Bool = UserDefaults.standard.bool(forKey: "showInReverseOrder") {
        didSet {
            defaults.set(showInReverseOrder, forKey: "showInReverseOrder")
        }
    }
    
    var terms = zoneTerms
    
    var zones = zoneData
}
