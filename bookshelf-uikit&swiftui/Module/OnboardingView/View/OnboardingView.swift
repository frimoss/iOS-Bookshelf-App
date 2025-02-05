//  OnboardingView.swift
//  Created by user on 23/01/2025.

import UIKit
import SwiftUI

protocol OnboardingViewProtocol: BaseViewProtocol {
    
}

class OnboardingView: UIViewController, OnboardingViewProtocol {
    
    // Connected View with Presenter! Get PresenterType from "OnboardingViewPresenterProtocol"
    typealias PresenterType = OnboardingViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Связали OnboardingView (UIKit) и OnboardingViewContent (SwiftUI)
        let contentView = OnboardingViewContent(slides: presenter?.mockData ?? []) { [weak self] in
            // Safety Code, получ self для Presenter'a через [weak self]
            guard let self = self else { return }
            
            // Срабатывает "Completion {}" из "OnboardingViewContent.swift"
            presenter?.startApp()
        }
//        let contentView = OnboardingViewContent { [weak self] in
//            guard let self = self else { return }
//            // Получаем и выводим Имя пользователя
//            print("User name:", $0)
//            presenter?.checkName(name: $0)
//        }
        
        // Делаем этот View в качестве root
        let content = UIHostingController(rootView: contentView)
        addChild(content) // Add as Child
        content.view.frame = view.frame // Заполняем наш View на весь Экран
        view.addSubview(content.view) // Add on View (Экран)
        content.didMove(toParent: self) // Parent?
    }
    
}
