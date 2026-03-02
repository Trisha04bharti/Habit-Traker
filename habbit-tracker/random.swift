//
//  random.swift
//  habbit-tracker
//
//  Created by Vikram Kumar on 27/02/26.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack {
                BoxView(title: "Sales")
                BoxView(title: "Revenue")
            }
            
            HStack {
                BoxView(title: "Customers")
                BoxView(title: "Orders")
            }
        }
        .padding()
    }
}

struct HeaderView: View {
    var body: some View {
        Text("Dashboard")
            .font(.largeTitle)
            .bold()
    }
}

struct BoxView: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
        }
        .frame(width: 150, height: 100)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    DashboardView()
}
