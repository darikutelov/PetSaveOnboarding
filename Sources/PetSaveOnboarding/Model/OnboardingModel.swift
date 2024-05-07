//
//  OnboardingModel.swift
//  MyPetSave
//
//  Created by Dariy Kutelov on 6.05.24.
//

import SwiftUI

public struct OnboardingModel: Identifiable {
    public let id = UUID()
    let title: String
    let description: String
    let image: Image
    
    let nextButtonTitle: String
    let skipButtonTitle: String
    
    public init(
        title: String,
        description: String,
        image: Image,
        nextButtonTitle: String = "Next",
        skipButtonTitle: String = "Skip") {
            self.title = title
            self.description = description
            self.image = image
            self.nextButtonTitle = nextButtonTitle
            self.skipButtonTitle = skipButtonTitle
        }
}
