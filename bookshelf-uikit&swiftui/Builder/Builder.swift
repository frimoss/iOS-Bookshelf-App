//  Builder.swift
//  Created by user on 21/01/2025.

import UIKit

// Также важно Presenter, так как у каждого View он может быть свой
// Принимаем любой PresenterType
protocol BaseViewProtocol: AnyObject {
    associatedtype PresenterType
    var presenter: PresenterType? { get set }
}

class Builder {
    // view
    // presenter
    
    // Чтобы не писать много повторяющих функицй для каждой View
    
    // Наша 1 универсальная функция, благодаря которой, мы сможем создавать все наши View'хи!
    // Подразуемаем, что у каждого View, который будет приходить будет тип: UIViewController и свой Presenter, который мы передадим, как протокол: BaseViewProtocol
    static private func createView<View: UIViewController & BaseViewProtocol>(viewType: View.Type, presenter: (View) -> View.PresenterType) -> UIViewController {
        
        let view = View() // Create View
        let presenter = presenter(view) // Create Presenter
        view.presenter = presenter // Add Presenter to View
        
        return view
    }
    
    
    // MARK: 1. Create RegistrationView
    static func createRegistrationView() -> UIViewController {
        return self.createView(viewType: RegistrationView.self) { view in
            // Соединяем View с её Presenter'ом!
            RegistrationViewPresenter(view: view)
        }
    }
    
    // MARK: 2. Creare OnboardingView
    static func createOnboardingView() -> UIViewController {
        return self.createView(viewType: OnboardingView.self) { view in
            // Соединяем View с её Presenter'ом!
            OnboardingViewPresenter(view: view)
        }
    }
    
    // MARK: 3. Create MainView (Main page)
    static func createMainView() -> UIViewController {
        let mainViewController = self.createView(viewType: MainView.self) { view in
            // Соединяем View с её Presenter'ом!
            MainViewPresenter(view: view)
        }
        // Добавили "mainViewController" в Навигацию!
        return UINavigationController(rootViewController: mainViewController)
    }
    
    // MARK: 4. Create DetailsView (Book page)
    static func createDetailsView() -> UIViewController {
        return self.createView(viewType: DetailsView.self) { view in
            // Соединяем View с её Presenter'ом!
            DetailsViewPresenter(view: view)
        }
    }
    
    // MARK: - Add Book
    // MARK: 5. Create Add Book View
    static func createAddBookView() -> UIViewController {
        return self.createView(viewType: AddBookView.self) { view in
            // Соединяем View с её Presenter'ом!
            AddBookPresenter(view: view)
        }
    }
    
    // MARK: 6. Create Book List View
    static func createBookListView(books: [BookModelItem]) -> UIViewController {
        return self.createView(viewType: BookListView.self) { view in
            // Соединяем View с её Presenter'ом!
            BookListPresenter(view: view, bookList: books)
        }
    }
    
    // MARK: 7. Create Add Details of Book View
    static func createAddDetailsView() -> UIViewController {
        return self.createView(viewType: AddDetailsView.self) { view in
            // Соединяем View с её Presenter'ом!
            AddDetailsPresenter(view: view)
        }
    }
    
}
