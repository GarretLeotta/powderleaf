//
//  BreakdownView.swift
//  Powderleaf
//
//  Created by Garret Leotta on 6/20/24.
//

import SwiftUI
import HealthKit

struct BreakdownView: View {
    let run: Running
    
    var body: some View {
        VStack(spacing: 5) {
            RunCard(run: run)
            ForEach(Array(Running.quantities.keys), id: \.self) { id in
                if let aggregate = run.aggregate(id: id) {
                    HStack {
                        Text("\(id.display())")
                        Spacer()
                        Text("\(aggregate)")
                    }
                }
            }
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    BreakdownView(run: .mock(Date()))
}
