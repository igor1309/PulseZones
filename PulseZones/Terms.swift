//
//  Terms.swift
//  PulseZones
//
//  Created by Igor Malyarov on 08.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct Terms : View {
    var term: String
    var definition: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(term)
//                .bold()
                .fontWeight(.light)
//                .foregroundColor(.secondary)
                .font(.subheadline)
//                .italic()
            
            Text(definition)
                .foregroundColor(.secondary)
                .font(.footnote)
//                .italic()
                .lineLimit(nil)
        }
            .padding(.top, 0)
    }
}


#if DEBUG
struct Terms_Previews : PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return Terms(term: userData.terms[0].key,
                     definition: userData.terms[0].value)
            .environmentObject(UserData())
            .previewLayout(.sizeThatFits)
    }
}
#endif
