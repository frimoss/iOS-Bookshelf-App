//  DataBaseManager.swift
//  Created by user on 27/01/2025.

import Foundation
import CoreData

final class DataBaseManager { // final class (закрытый) для Singleton?
    
    // Singleton - работает как Банкир (снять и положить деньги)
    
    // Реализовываем Singleton - создаем только один экземпляр, и предоставляет глобальную точку доступа к этому экземпляру
    static let shared = DataBaseManager() // shared - статическая константа, которая инициализирует единственный экземпляр нашего класса "DataBaseManager"
    private init() { } // private init - предотвращает создание других экземпляров этого класса!
    
    
    private let storageManager = StorageManager() // Наш StorageManager из StorageManager.swift
    var books: [Book] = []
    
    
    // MARK: - Container
    
    // MARK: Достать данные из CoreData
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "db")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: Сохранить данные в CoreData
    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension DataBaseManager {
    // MARK: Book
    // C-R-U-D (Create, Read, Update, Delete)
    
    // 1. CreateBook
    /// `createBook()` - функция для Сохранения 1 книги
    /// *name* - Название книги
    /// *author* - Имя автора
    /// *description* - Описание книги
    /// *cover* - Обложка книги (изображение)
    
    func createBook(name: String, author: String, description: String, cover: Data) {
        let bookId = UUID().uuidString // Create unic ID (String)
        
        // let book = Book(context: persistentContainer.viewContext) - то же самое!
        let _ : Book = {
            $0.id = bookId
            $0.name = name
            $0.date = Date()
            $0.author = author
            $0.status = BookStatus.willRead.rawValue // 0 – willRead
            $0.bookDescription = description
            $0.coverURL = "cover.jpeg" // Путь будет такой: "bookId/cover.jpeg"
            
            return $0
        }(Book(context: persistentContainer.viewContext)) // Поместили Book в "Context", ещё НЕ в db
        
        // Сохранить Context с Book в "db" Базу данных (CoreData)
        saveContext()
        
        // Сохранить Cover в "storageManager"
        storageManager.saveCover(bookId: bookId, cover: cover)
    }
    
    
    // 2. FetchBooks
    /// `fetchBooks` - метод для получения всех книг
    
    func fetchBooks() {
        let request = Book.fetchRequest() // fetchRequest - дефолтный метод из "Book+CoreDataClass.swift"
        
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        /// `sortDescriptors` - предустанов. функц.  Apple для сортировки в `fetchRequest`
        /// `ascending: true` - "восходящий" - *самый РАННИЙ первым выводится*
        /// `ascending: false` - "нисходящий" - *самый ПОЗДНИЙ первым выводится*
        
        // Если нам будет нужно получать Book с определнным Case (например: читаю или буду читать)
        /// `request.predicate = NSPredicate(format: "", .значение)`
        ///  ИЛИ
        /// `request.predicate = NSPredicate(predicate: Predicate<Input>)`
        
        // Получаем массив Books
        do {
            let books = try persistentContainer.viewContext.fetch(request)
            self.books = books
        } catch {
            print("Error in fetchBooks()")
            print(error.localizedDescription)
        }
        
    }
}

extension DataBaseManager {
    // MARK: Note
    
    /// `addNote()` - Добавление заметки к конкретной книге
    
    func addNote(book: Book, noteText: String) {
        let _ : Note = {
            $0.id = UUID().uuidString
            $0.date = Date()
            $0.text = noteText
            $0.book = book
            
            return $0
        }(Note(context: persistentContainer.viewContext)) // Поместили Note в "Context"
    }
}
