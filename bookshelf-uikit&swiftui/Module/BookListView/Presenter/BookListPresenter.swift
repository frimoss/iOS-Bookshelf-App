//  BookListPresenter.swift
//  Created by user on 01/02/2025.

import Foundation

protocol BookListPresenterProtocol: AnyObject {
    var bookList: [BookModelItem]? { get }
}

class BookListPresenter: BookListPresenterProtocol {
    var bookList: [BookModelItem]?
    
    weak var view: (any BookListViewProtocol)?
    
    init(view: any BookListViewProtocol, bookList: [BookModelItem]?) {
        self.view = view
        self.bookList = bookList
    }
}
