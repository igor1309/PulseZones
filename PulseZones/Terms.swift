//
//  Terms.swift
//  PulseZones
//
//  Created by Igor Malyarov on 08.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ExplanationText: View {
    var name: String
    
    var body: some View {
        Text(name)
            .foregroundColor(.secondary)
            .font(.footnote)
    }
}

struct Terms : View {
    var term: String
    var definition: String
    
    var body: some View {
        Section(header:
            Text(term)
                .fontWeight(.light)
                .font(.subheadline)
        ){
//            Text(definition)
//                .foregroundColor(.secondary)
//                .font(.footnote)
            ExplanationText(name: definition)
                .lineLimit(nil)
        }
    }
}


#if DEBUG
struct Terms_Previews : PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        
        return Form {
            Terms(term: userData.terms[0].key,
                  definition: userData.terms[0].value)
            
            Terms(term: userData.terms[1].key,
                  definition: userData.terms[1].value)
            
            Terms(term: userData.terms[2].key,
                  definition: userData.terms[2].value)
        }
        .environmentObject(UserData())
        .previewLayout(.sizeThatFits)
    }
}
#endif
