//  RegistrationView.swift
//  Created by user on 21/01/2025.

import UIKit
import SwiftUI

protocol RegistrationViewProtocol: BaseViewProtocol {
    
}

class RegistrationView: UIViewController, RegistrationViewProtocol {
    
    // Connected View and Presenter! Get PresenterType from "RegistrationViewPresenter Protocol
    typealias PresenterType = RegistrationViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Наша View будет Верстаться НЕ Здесь!!! А в нашем RegistrationViewContent (SwiftUI)
        
        // Связали RegistrationView (UIKit) и RegistrationViewContent (SwiftUI)
        let contentView = RegistrationViewContent { [weak self] in
            // Safety Code (тк self?), получ self для Presenter'a через [weak self]
            guard let self = self else { return }
            
            // Имя пользователя = $0 (получили из "RegistrationViewContent {}")
            presenter?.checkName(name: $0)
        }
        
        // Делаем его root
        let content = UIHostingController(rootView: contentView)
        addChild(content) // Add as Child
        content.view.frame = view.frame // Заполняем наш View на весь Экран
        view.addSubview(content.view) // Add on View (Экран)
        content.didMove(toParent: self) // Parent?
        
    }
}
