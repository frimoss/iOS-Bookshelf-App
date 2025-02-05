//  DetailsViewPresenter.swift
//  Created by user on 30/01/2025.

import Foundation

protocol DetailsViewPresenterProtocol: AnyObject {
    
}

class DetailsViewPresenter: DetailsViewPresenterProtocol {
    // Принимаем view + протокол из "OnboardingViewProtocol"
    weak var view: (any DetailsViewProtocol)?
    // Инициализируем нашу View (Объединяем наши view?)
    init(view: any DetailsViewProtocol) {
        self.view = view
    }
}
