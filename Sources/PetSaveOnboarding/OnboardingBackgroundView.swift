//
//  OnboardingBackgroundView.swift
//  PetSaveOnboarding
//
//  Created by Dariy Kutelov on 7.05.24.
//

import SwiftUI

import SwiftUI

struct OnboardingBackgroundView: View {
    let backgroundPets = Pet.backgroundPets

    var body: some View {
        ZStack {
            ForEach(backgroundPets) { pet in
                pet.petImage
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .position(pet.position)
            }
        }
    }
}


#Preview {
    OnboardingBackgroundView()
}
