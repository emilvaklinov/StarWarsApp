//
//  RefreshControl.swift
//  StarWarsAPIViewer
//
//  Created by Emil Vaklinov on 29/06/2023.
//

import SwiftUI

struct RefreshControl: View {
    @Binding var isRefreshing: Bool
    let onRefresh: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if isRefreshing {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                }
                
                Spacer()
            }
            .frame(height: geometry.size.height)
            .offset(y: -geometry.size.height)
            .onAppear {
                if isRefreshing {
                    onRefresh()
                }
            }
        }
    }
}
