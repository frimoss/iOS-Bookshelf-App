//  AddBookView.swift
//  Created by user on 01/02/2025.

import UIKit
import SwiftUI

protocol AddBookViewProtocol: BaseViewProtocol {
    func goToListView(books: [BookModelItem])
}

class AddBookView: UIViewController, AddBookViewProtocol {
    
    // Выполняем "BaseViewProtocol"
    typealias PresenterType = AddBookPresenterProtocol
    var presenter: PresenterType?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Связали DetailsView (UIKit) и DetailsViewContent (SwiftUI)
        let contentView = AddBookViewContent() { [weak self] direction in
            
            // [weak self] - Безопасный код? 
            guard let self = self else { return }
            
            switch direction {
            case .to(let bookName):
                //MARK: Запрос
                if bookName.count > 2 {
                    self.presenter?.searchBook(by: bookName)
                }
            case .back:
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        // Делаем этот View в качестве root
        let content = UIHostingController(rootView: contentView)
        addChild(content) // Add as Child
        content.view.frame = view.frame // Заполняем наш View на весь Экран
        view.addSubview(content.view) // Add on View (Экран)
        content.didMove(toParent: self) // Parent?
                
    }
    
    func goToListView(books: [BookModelItem]) {
        let vc = Builder.createBookListView(books: books)
        navigationController?.pushViewController(vc, animated: true)
    }

    

}
