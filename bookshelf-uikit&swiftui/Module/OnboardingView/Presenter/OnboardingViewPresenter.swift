//  OnboardingViewPresenter.swift
//  Created by user on 23/01/2025.

import Foundation
import UIKit

protocol OnboardingViewPresenterProtocol: AnyObject {
    var mockData: [OnboardingViewData] { get } // get - на получение
    func startApp()
}

class OnboardingViewPresenter: OnboardingViewPresenterProtocol {
    var mockData: [OnboardingViewData] = OnboardingViewData.mockData
    
    // Принимаем view + протокол из "OnboardingViewProtocol"
    weak var view: (any OnboardingViewProtocol)?
    // Инициализируем нашу View (Объединяем наши view?)
    init(view: any OnboardingViewProtocol) {
        self.view = view
    }
    
    // Старт приложения, после Onboarding
    func startApp() {
        // Save Next State (go to Main View)
        UserDefaults.standard.set(WindowCase.main.rawValue, forKey: "state")
        
        // Переход на Main View
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.windowInfo: WindowCase.main])
    }
}
