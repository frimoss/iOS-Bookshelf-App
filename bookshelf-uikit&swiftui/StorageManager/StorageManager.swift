//  StorageManager.swift
//  Created by user on 27/01/2025.

import Foundation

// НЕ Singleton!
// Файловый менеджер, чтобы Сохранять Медиа-Данные на телефоне
class StorageManager {
    
    private var path = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)[0] // добавили [0] - чтобы не было Опционала, так как нам лишь 1 path и нужен)
    
    
    // MARK: Save Cover
    /// `saveCover()` - функция для сохранения Обложки книги
    /// `cover.jpeg` - стандартное название обложки
    /// `bookId/cover.jpeg` - уникальный путь к обложке для каждой книги
    
    func saveCover(bookId: String, cover: Data) {
        
        // Добавляем в конец Path наш уникальный "/bookId/"
        let bookPath = path.appending(component: bookId)
        // Создаем папку по этому пути
        try? FileManager.default.createDirectory(at: bookPath, withIntermediateDirectories: true)
        
        // Наш coverPath "/bookId/cover.jpeg"
        let coverPath = bookPath.appending(component: "cover.jpeg")
        
        // Сохраняем обложку по нашему coverPath "/bookId/cover.jpeg"
        do {
            try cover.write(to: coverPath) // Cover - наша обложка, приходящая в функц.
        } catch {
            print("Error in saveCover()")
            print(error.localizedDescription)
        }
    }
    
    // MARK: Get Cover
    /// `getCover()` - метод для получения файла Обложки книги
    //  возвращаем Data (Binary)
    func getCover(bookId: String) -> Data? {
        
        // Create coverPath = ".../bookId/cover.jpeg"
        let coverPath = path
            .appending(component: bookId)
            .appending(component: "cover.jpeg")
        
        // Выводим Обложку (в Data - Бинарным файлом)
        do {
            let coverData = try Data(contentsOf: coverPath)
            return coverData
        } catch {
            print("Error in getCover()")
            print(error.localizedDescription)
            return nil
        }
    }
}
