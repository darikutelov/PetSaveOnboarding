//
//  SwiftUIView.swift
//  
//
//  Created by Dariy Kutelov on 7.05.24.
//

import SwiftUI

struct PetSaveOnboardingView: View {
    @State var currentPageIndex = 0
    private var onNext: (_ currentIndex: Int) -> Void = { _ in }
    private var onSkip: () -> Void = {}
    private var items: [OnboardingModel] = []
    
    private var nextButtonTitle: String {
        items[currentPageIndex].nextButtonTitle
    }
    private var skipButtonTitle: String {
        items[currentPageIndex].skipButtonTitle
    }
    
    public init(items: [OnboardingModel]) {
        self.items = items
    }
    
    var body: some View {
        if items.isEmpty {
            Text("No items to show.")
        } else {
            VStack {
                TabView(selection: $currentPageIndex) {
                    // 1
                    ForEach(0..<items.count) { index in
                        OnboardingView(onboarding: items[index])
                            .tag(index)
                    }
                }
                .padding(.bottom, 10)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .onAppear(perform: setupPageControlAppearance)
                // 2
                Button(action: next) {
                    Text(currentPageIndex == items.count - 1 ?
                         "Start Over" : nextButtonTitle)
                        .frame(maxWidth: .infinity, maxHeight: 44)
                }
                .animation(nil, value: currentPageIndex)
                .buttonStyle(OnboardingButtonStyle(color: .rwDark))
                
                Button(action: onSkip) {
                    Text(currentPageIndex == items.count - 1 ?
                         "Finish" : skipButtonTitle)
                        .frame(maxWidth: .infinity, maxHeight: 44)
                }
                .animation(nil, value: currentPageIndex)
                .buttonStyle(OnboardingButtonStyle(color: .rwGreen))
                .padding(.bottom, 20)
            }
            .background(OnboardingBackgroundView())
        }
    }
    
    public func onNext(
        action: @escaping (_ currentIndex: Int) -> Void
    ) -> Self {
        var petSaveOnboardingView = self
        petSaveOnboardingView.onNext = action
        return petSaveOnboardingView
    }
    
    public func onSkip(action: @escaping () -> Void) -> Self {
        var petSaveOnboardingView = self
        petSaveOnboardingView.onSkip = action
        return petSaveOnboardingView
    }
    
    
    private func setupPageControlAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor =
        UIColor(.rwGreen)
    }
    
    private func next() {
        withAnimation {
            if currentPageIndex + 1 < items.count {
                currentPageIndex += 1
            } else {
                currentPageIndex = 0
            }
        }
        onNext(currentPageIndex)
    }

}

#Preview {
    PetSaveOnboardingView(items: [
        OnboardingModel(
            title: "Welcome to\n PetSave",
            description: "Looking for a Pet?\n Then you're at the right place",
            image: .bird
        ),
        OnboardingModel(
            title: "Search...",
            description: "Search from a list of our huge database of animals.",
            image: .dogBoneStand,
            nextButtonTitle: "Allow"
        ),
        OnboardingModel(
            title: "Nearby",
            description: "Find pets to adopt from nearby your place...",
            image: .chameleon
        )
    ])
}

struct OnboardingButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(color)
            .clipShape(Capsule())
            .buttonStyle(.plain)
            .padding(.horizontal, 20)
            .foregroundColor(.white)
    }
}

