//  RegistrationViewPresenter.swift
//  Created by user on 21/01/2025.

import Foundation

protocol RegistrationViewPresenterProtocol: AnyObject {
    // Tут будут все методы, которые будет View нам отправлять :)
    func checkName(name: String)
}

class RegistrationViewPresenter: RegistrationViewPresenterProtocol {
    // Принимаем view + протокол из "RegistrationView"
    weak var view: (any RegistrationViewProtocol)?
    // Инициализируем нашу View (Объединяем наши view?)
    init(view: any RegistrationViewProtocol) {
        self.view = view
    }
    
    // Get name from User
    func checkName(name: String) {
        if name.count >= 2 {
            // Save name in "UserDefaults"
            UserDefaults.standard.set(name, forKey: "name")
            // Save Next State (go to Onboarding View)
            UserDefaults.standard.set(WindowCase.onboarding.rawValue, forKey: "state")
            
            // Call NotificationCenter to navigate to Next view "Onboarding"
            NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.windowInfo: WindowCase.onboarding])
        }
        else {
            print("Name error!")
        }
    }
}
