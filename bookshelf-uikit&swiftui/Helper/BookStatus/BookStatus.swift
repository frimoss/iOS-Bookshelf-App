//  BookStatus.swift
//  Created by user on 27/01/2025.

import Foundation

// MARK: Book Status
/// 0 – willRead
/// 1 – read
/// 2 – didRead

enum BookStatus: Int16 {
    case willRead
    case read
    case didRead
}
