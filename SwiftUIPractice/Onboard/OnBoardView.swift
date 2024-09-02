//
//  OnBoardView.swift
//  SwiftUIPractice
//
//  Created by 쌩 on 9/2/24.
//

import SwiftUI

struct OnBoardView: View {
    var body: some View {
        VStack {
            Image("launch")
                .padding(.vertical)
                .padding(.vertical)
            Image("launchImage")
                .padding()
            Spacer()
            NavigationLink("가입하기") {
                ProfileSettingView()
            }
            .foregroundStyle(.white)
            .frame(width: 350, height: 50)
            .background(.blue)
            .clipShape(.capsule)
        }
    }
}

#Preview {
    OnBoardView()
}

