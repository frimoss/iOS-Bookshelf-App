//  AddBookPresenter.swift
//  Created by user on 01/02/2025.

import Foundation

protocol AddBookPresenterProtocol: AnyObject {
    func searchBook(by title: String)
}

class AddBookPresenter: AddBookPresenterProtocol {
    weak var view: (any AddBookViewProtocol)?
    
    private let manager = BookNetworkManager()
    
    init(view: any AddBookViewProtocol) {
        self.view = view
    }
    
    //MARK: Запрос
    func searchBook(by title: String) {
        manager.searchBookRequest(q: title) { [weak self] books in
            guard let self = self else { return }
            
            switch books {
            case .success(let success):
                
                //MARK: Многопоточность!!! Иначе выдает ошибку по потокам
                DispatchQueue.main.async {
                    self.view?.goToListView(books: success) // Передаем Книги в "BookListView"
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
    }
}
