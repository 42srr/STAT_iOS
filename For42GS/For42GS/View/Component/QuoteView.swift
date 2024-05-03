//
//  QuoteView.swift
//  For42GS
//
//  Created by devoogie on 5/2/24.
//

import SwiftUI

struct QuoteView: View {
    @EnvironmentObject var service : Service

    var body: some View {
        VStack{
            Text(service.quotes.content)
            Text(service.quotes.name)
        }
    }
}

#Preview {
    QuoteView()
}
