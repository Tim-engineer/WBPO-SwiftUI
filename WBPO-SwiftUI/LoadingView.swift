//
//  LoadingView.swift
//  WBPO-SwiftUI
//
//  Created by Tim Matlak on 25/05/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .tint(.accentColor)
        }
    }
}
