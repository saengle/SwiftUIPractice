//
//  ProfileSettingView.swift
//  SwiftUIPractice
//
//  Created by 쌩 on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State private var nickName = ""
    
    @State private var list = [0, 0, 0, 0]
    
    private let mbti = [("E", "I"), ("N", "S"), ("F", "T"), ("P", "J")]
    
    private var mbtiConditionPassed: Bool {
        var count = 0
        for e in list {
            if e != 0 {
                count += 1
            }
        }
        return count == 4 ? true : false
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Image("profile_0")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(.white)
                    .clipShape(.circle)
                    .padding(3)
                    .background(.blue)
                    .clipShape(.circle)
                
                TextField("닉네임을 입력하세요", text: $nickName)
                    .underline()
                    .padding()
                HStack{
                    Text("MBTI")
                        .padding()
                    Spacer()
                    ForEach(0..<4) { item in
                        VStack{
                            Button(mbti[item].0) {
                                mbtiClicked(index: &list[item], true)
                            }
                            .foregroundStyle(list[item] == 1 ? .blue : .gray)
                            .padding()
                            .background(.white)
                            .clipShape(.circle)
                            .padding(2)
                            .background(list[item] == 1 ? .blue : .gray)
                            .clipShape(.circle)
                            
                            Button(mbti[item].1) {
                                mbtiClicked(index: &list[item], false)
                            }
                            .foregroundStyle(list[item] == 2 ? .blue : .gray)
                            .padding()
                            .background(.white)
                            .clipShape(.circle)
                            .padding(2)
                            .background(list[item] == 2 ? .blue : .gray)
                            .clipShape(.circle)
                        }
                    }
                }
                Spacer()
                NavigationLink("완료") {
                    if mbtiConditionPassed == true {
                        DoneView()
                    }
                }
                .foregroundStyle(.white)
                .frame(width: 350, height: 50)
                .background(.blue)
                .clipShape(.capsule)
            }
            .navigationTitle("PROFILE SETTING")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func mbtiClicked(index: inout Int, _ isFirst: Bool) {
        if isFirst == true {
            switch index {
            case 0:
                index = 1
            case 1:
                index = 0
            case 2:
                index = 1
            default:
                print("problem occured")
            }
        } else {
            switch index {
            case 0:
                index = 2
            case 1:
                index = 2
            case 2:
                index = 0
            default:
                print("problem occured")
            }
        }
        print(#function , list)
    }
}

#Preview {
    ProfileSettingView()
}
