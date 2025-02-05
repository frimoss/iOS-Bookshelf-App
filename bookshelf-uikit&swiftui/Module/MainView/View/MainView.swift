//  MainView.swift
//  Created by user on 29/01/2025.

import UIKit
import SwiftUI

protocol MainViewProtocol: BaseViewProtocol {
    
}

class MainView: UIViewController, MainViewProtocol {
    // Выполняем "BaseViewProtocol"
    typealias PresenterType = MainViewPresenterProtocol
    var presenter: PresenterType?
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Связали MainView (UIKit) и MainViewContent (SwiftUI)
        let contentView = MainViewContent(name: presenter?.name ?? "") {
            self.navigationToVC(book: nil)
        }
        
        // Делаем этот View в качестве root
        let content = UIHostingController(rootView: contentView)
        addChild(content) // Add as Child
        content.view.frame = view.frame // Заполняем наш View на весь Экран
        view.addSubview(content.view) // Add on View (Экран)
        content.didMove(toParent: self) // Parent?
        
        
        // UIKit: при использовании UINavigationController в "Builder", автоматом создается
        /// `верхний navigationBar и пустой title`
        
        // title = "My First ViewController" // показать title для примера в "navigationBar"
        navigationController?.navigationBar.isHidden = true // Скрываем "navigationBar", так как у нас своя навигация и свот title's ;)
    }
    
    private func navigationToVC(book: Book?) {
        if let book {
            //Go to Book page
        } else {
            //Go to Add book
            let vc = Builder.createAddBookView()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

