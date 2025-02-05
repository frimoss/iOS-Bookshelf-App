//  MainViewPresenter.swift
//  Created by user on 29/01/2025.

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    // Принимаем имя "UserDefaults"
    var name: String { get }
}

class MainViewPresenter: MainViewPresenterProtocol {
    weak var view: (any MainViewProtocol)?
    var name: String
    
    init(view: any MainViewProtocol) {
        self.view = view
        self.name = UserDefaults.standard.string(forKey: "name") ?? ""
    }

}
