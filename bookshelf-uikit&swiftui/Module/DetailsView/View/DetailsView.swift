//  DetailsView.swift
//  Created by user on 30/01/2025.

import UIKit
import SwiftUI

protocol DetailsViewProtocol: BaseViewProtocol {
    
}

class DetailsView: UIViewController, DetailsViewProtocol {
    // Выполняем "BaseViewProtocol"
    typealias PresenterType = DetailsViewPresenterProtocol
    var presenter: PresenterType?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Связали DetailsView (UIKit) и DetailsViewContent (SwiftUI)
        let contentView = DetailsViewContent()
        
        // Делаем этот View в качестве root
        let content = UIHostingController(rootView: contentView)
        addChild(content) // Add as Child
        content.view.frame = view.frame // Заполняем наш View на весь Экран
        view.addSubview(content.view) // Add on View (Экран)
        content.didMove(toParent: self) // Parent?
    }

}
