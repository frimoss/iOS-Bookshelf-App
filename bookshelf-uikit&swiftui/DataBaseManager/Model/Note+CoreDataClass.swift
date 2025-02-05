//  Note+CoreDataClass.swift
//  Created by user on 27/01/2025.

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {

}

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: String?
    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var book: Book?

}

extension Note : Identifiable {
    func deleteNote() {
        managedObjectContext?.delete(self) // Delete из "Context" self (текущую выбранную Note)
        try? managedObjectContext?.save() // Try Сохранить изменения в CoreData
    }
}
