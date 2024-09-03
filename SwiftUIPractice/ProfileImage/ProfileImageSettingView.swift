//
//  ProfileImageSettingView.swift
//  SwiftUIPractice
//
//  Created by 쌩 on 9/3/24.
//

import SwiftUI

struct ProfileImageSettingView: View {
    
    let imageList = [
        "profile_0", "profile_1", "profile_2", "profile_3",
        "profile_4", "profile_5", "profile_6", "profile_7",
        "profile_8", "profile_9", "profile_10", "profile_11"
    ]
    
    var body: some View {

                Image(imageList[0])
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(.white)
                    .clipShape(.circle)
                    .padding(3)
                    .background(.blue)
                    .clipShape(.circle)
         
        Grid {
            GridRow {
                ForEach(0..<4) { index in
                    Image(imageList[index])
                        .resizable()
                        .frame(width: 80, height: 80)
                        .background(.white)
                        .clipShape(.circle)
                        .padding(3)
                        .background(.blue)
                        .clipShape(.circle)
                }
            }
            GridRow {
                ForEach(4..<8) { index in
                    Image(imageList[index])
                        .resizable()
                        .frame(width: 80, height: 80)
                        .background(.white)
                        .clipShape(.circle)
                        .padding(3)
                        .background(.blue)
                        .clipShape(.circle)
                }
            }
            GridRow {
                ForEach(8..<12) { index in
                    Image(imageList[index])
                        .resizable()
                        .frame(width: 80, height: 80)
                        .background(.white)
                        .clipShape(.circle)
                        .padding(3)
                        .background(.blue)
                        .clipShape(.circle)
                }
            }
            
        }
    }
}

#Preview {
    ProfileImageSettingView()
}
