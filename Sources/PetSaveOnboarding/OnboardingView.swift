//
//  OnboardingView.swift
//  PetSaveOnboarding
//
//  Created by Dariy Kutelov on 7.05.24.
//

import SwiftUI

struct OnboardingView: View {
    let onboarding: OnboardingModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .circular)
                .fill(.white)
                .shadow(radius: 12)
                .padding(.horizontal, 20)
            VStack(alignment: .center) {
                VStack {
                    // 2
                    Text(onboarding.title)
                        .foregroundColor(.rwDark)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                    
                    Text(onboarding.description)
                        .foregroundColor(.rwDark)
                        .multilineTextAlignment(.center)
                        .padding([.top, .bottom], 10)
                        .padding(.horizontal, 10)
                    
                    onboarding.image
                        .resizable()
                        .frame(width: 140, height: 140, alignment: .center)
                        .foregroundColor(.rwDark)
                        .aspectRatio(contentMode: .fit)
                }
                .padding()
            }
        }
    }
}


#Preview {
    Group {
        OnboardingView(onboarding: OnboardingModel(
            title: "Welcome to PetSave",
            description: "Looking for a Pet? Then you're at the right place",
            image: .bird)
        )
    }
}
