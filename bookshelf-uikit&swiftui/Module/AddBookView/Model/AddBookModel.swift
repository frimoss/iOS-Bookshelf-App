//  AddBookModel.swift
//  Created by user on 05/02/2025.

import Foundation

struct BookModel: Decodable, Hashable { // Hashable - для выводва с цилке ForEach
    let docs: [BookModelItem]
}

struct BookModelItem: Decodable, Hashable { // Hashable - для выводва с цилке ForEach
    let author_name: [String]?
    let cover_i: Int?
    let title: String?
}
