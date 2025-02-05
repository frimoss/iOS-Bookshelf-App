//  AddDetailsView.swift
//  Created by user on 01/02/2025.

import UIKit
import SwiftUI

protocol AddDetailsViewProtocol: BaseViewProtocol {
    
}

class AddDetailsView: UIViewController, AddDetailsViewProtocol {
    
    // Выполняем "BaseViewProtocol"
    typealias PresenterType = AddDetailsPresenterProtocol
    var presenter: PresenterType?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Связали DetailsView (UIKit) и DetailsViewContent (SwiftUI)
        let contentView = AddDetailsViewContent()
        
        // Делаем этот View в качестве root
        let content = UIHostingController(rootView: contentView)
        addChild(content) // Add as Child
        content.view.frame = view.frame // Заполняем наш View на весь Экран
        view.addSubview(content.view) // Add on View (Экран)
        content.didMove(toParent: self) // Parent?
       
    }
    

}
