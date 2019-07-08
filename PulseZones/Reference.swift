//
//  Reference.swift
//  PulseZones
//
//  Created by Igor Malyarov on 07.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//
//  Пульсовые зоны: на каком пульсе бегать | "Марафонец"
//  https://marathonec.ru/hr-zones/

import SwiftUI

struct Reference : View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        //  loop through dictionary with ForEach
        //  https://www.oipapio.com/question-4575439
        let keys = userData.terms.map{$0.key}
        let values = userData.terms.map {$0.value}
        
        return NavigationView {
            List {
                Group {
                    Picker(selection: $userData.gender,
                        label: Text("Пол")) {
                            Text("женский").tag(0)
                            Text("мужской").tag(1)
                            Text("бинарный").tag(2)
                            Text("другой").tag(3)
                    }

//                    VStack(alignment: .leading) {
//                        Text("Пол")
//                        
//                        SegmentedControl(selection: $userData.gender) {
//                            Text("женский").tag(0)
//                            Text("мужской").tag(1)
//                            Text("бинарный").tag(2)
//                            Text("другой").tag(3)
//                        }
//                    }
                    
                    HStack {
                        Text("Возраст: \(Int(userData.age))")
                        
                        Slider(value: $userData.age, from: 15.0, through: 100.0, by: 5.0)
                    }
                    
                    Text("МЧСС = \(userData.maxPulse)*")
                        .font(.headline)
                        .fontWeight(.black)
                        .color(.green)
                }
                
                if userData.showInReverseOrder {
                    ForEach(userData.zones.reversed()) { zone in
                        ReferenceBlock(zone: zone)
                            .environmentObject(self.userData)
                    }
                }
                else {
                    ForEach(userData.zones) { zone in
                        ReferenceBlock(zone: zone)
                        .environmentObject(self.userData)
                    }
                }
                
                Section(header:
                    HStack {
                        Image(systemName: "text.justify")
                            .foregroundColor(.secondary)
                        Text("Примечания".uppercased())
                            .padding(.vertical, 8)
                    })
                {
                    //                ZoneList()
                    ForEach(keys.indices) {index in
                        Terms(term: keys[index], definition: values[index])
                    }
                }
            }

            .navigationBarTitle(Text(verbatim: "Пульсовые зоны"))
        
            .navigationBarItems(
                trailing:
                Toggle(isOn: $userData.showInReverseOrder
                    .animation()
                    ) {
                        Text("обратный порядок".uppercased())
                            .font(.caption)
                            .fontWeight(.light)
                            .color(.green)
                    }
            )
            
        }
    }
}

#if DEBUG
struct Reference_Previews : PreviewProvider {
    static var previews: some View {
        Reference()
//        .environment(\.colorScheme, .dark)
            .environmentObject(UserData())
//            .environment(\.sizeCategory, .extraExtraExtraLarge)

    }
}
#endif
