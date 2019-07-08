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

    @State private var maxPulse = 180.0
    @State private var genderSelector = 1
    @State private var age = 45.0
    
    var body: some View {
        NavigationView {
            List {
                Picker(selection: $genderSelector,
                       label: Text("Пол")) {
                        Text("женский").tag(0)
                        Text("мужской").tag(1)
                        Text("бинарный").tag(2)
                        Text("другой").tag(3)
                        
                }
                
                VStack(alignment: .leading) {
                    Text("Пол")
                    
                    SegmentedControl(selection: $genderSelector) {
                        Text("женский").tag(0)
                        Text("мужской").tag(1)
                        Text("бинарный").tag(2)
                        Text("другой").tag(3)
                    }
                }
                
                HStack {
                    Text("Возраст: \(Int(age))")
                    
                    Slider(value: $age, from: 20.0, through: 100.0, by: 5.0)
                }
                
                //TODO:- доделать вычисления
                Text("МЧСС* = ") + Text(" ДОДЕЛАТЬ!!!".uppercased()).color(.red).bold().font(.title)
                
                ForEach(userData.zones) { zone in
                    // TODO:- вставить сортировку и в обратном порядке userData.showInReverseOrder
                    ReferenceBlock(zone: zone)
                }
                
                VStack(alignment: .leading) {
                    Text("Примечания".uppercased())
                        .color(.secondary)
                        .padding(.bottom, 0)
                
                    Text("МЧСС – это наибольшее количество сокращений сердца в минуту, которое достигается на пределе возможностей организма во время интенсивной тренировки. Это самое большое количество ударов в минуту, которое ваше сердце способно совершать при максимальной нагрузке.")
                        .color(.secondary)
                        .font(.footnote)
                        .italic()
                        .lineLimit(nil)
                }
            }

            .navigationBarTitle(Text(verbatim: "Пульсовые зоны"))
        
            .navigationBarItems(
                trailing:
                Toggle(isOn: $userData.showInReverseOrder
                    .animation()
                    ) {
                        Text("show in reverse order".uppercased())
                            .font(.caption)
                            .color(.secondary)
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

    }
}
#endif
