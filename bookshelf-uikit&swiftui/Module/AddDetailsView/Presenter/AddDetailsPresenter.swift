//  AddDetailsPresenter.swift
//  Created by user on 01/02/2025.

import Foundation

protocol AddDetailsPresenterProtocol: AnyObject {
    
}

class AddDetailsPresenter: AddDetailsPresenterProtocol {
    weak var view: (any AddDetailsViewProtocol)?
    
    init(view: any AddDetailsViewProtocol) {
        self.view = view
    }
}
