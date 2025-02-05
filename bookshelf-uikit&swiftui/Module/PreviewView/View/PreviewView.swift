//  PreviewView.swift
//  Created by user on 21/01/2025.

import UIKit
import Lottie

class PreviewView: UIViewController {
    
    // Default: First View - RegistrationView
    var state: WindowCase = .reg
    
    // Create Animation Lottie (Animation Library by Airbnb)
    lazy var lottieView: LottieAnimationView = {
        // Square in the Center of View
        $0.frame.size = CGSize(width: view.frame.width - 80, height: view.frame.width - 80) // Square 80x80
        $0.center = view.center // По центру
        $0.contentMode = .scaleAspectFit // scaleAspectFit - в исходном соотношении сторон
        $0.loopMode = .loop // loop Lottie Animation
        
        return $0
    }(LottieAnimationView(name: "bookAnimation"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgMain
        
        // Add Animation on View
        view.addSubview(lottieView)
        
        // Достаем "state" из UserDefaults - чтобы пользователь начал с того же места
        /// `reg / onboarding / main` in SceneDelegate.swift
    
        if let stateRaw = UserDefaults.standard.string(forKey: "state") {
            if let state = WindowCase(rawValue: stateRaw) {
                self.state = state
            }
        }
        
        // Play Lottie Animation (от 0 до последнего фрейма, в этой анимации: 240)
        lottieView.play(fromFrame: 0, toFrame: 240, loopMode: .playOnce) { completed in
            // Переходим на Reg/Onboard/Main view (смотря где остановился пользователь)
            NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.windowInfo: self.state])
        }
        
        
    }
    
}

