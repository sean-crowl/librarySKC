//
//  library.swift
//  LibrarySKC
//
//  Created by Sean Crowl on 10/11/16.
//  Copyright © 2016 Interapt. All rights reserved.
//

import Foundation

class Library {
    private var done: Bool = false
    private var currentInput: String = ""
    private var io = Io()
    let date = DateFormatter.localizedString(from: Date() as Date, dateStyle: .short, timeStyle: .short)
    let dueDate = DateFormatter.localizedString(from: Date(timeIntervalSinceNow: 604800) as Date, dateStyle: .short, timeStyle: .short)
    
    var library:[String:String] = ["Hop On Pop - by Dr. Seuss":"Checked In",
                                   "Jurassic Park - by Michael Crichton":"Checked In",
                                   "The Great Gatsby - by F. Scott Fitzgerald":"Checked In",
                                   "A Tale of Two Cities - by Charles Dickens":"Checked In",
                                   "Friday Night Lights - by H. G. Bissinger":"Checked In"]
    var libraryCurrent:[String:String] = ["A Tale of Two Cities":"Checked In",
                                          "Friday Night Lights":"Checked In",
                                          "Hop On Pop":"Checked In",
                                          "Jurassic Park":"Checked In",
                                          "The Great Gatsby":"Checked In"]
    var libraryOut:[String:String] = [:]
    
    
    func checkOut() {
        io.writeMessage("\nWhat book would you like to check out?")
        currentInput = io.getInput()
        if libraryCurrent.keys.contains(currentInput) {
            print("\nYou have checked out \(currentInput)! Is is due back on \(dueDate).\n")
            libraryCurrent.removeValue(forKey: currentInput)
            libraryOut[currentInput] = "Due Back: \(dueDate)"
        } else {
            print("\nUnfortunately, this book is unavailable!\n")
        }
    }
    
    func checkIn() {
    io.writeMessage("\nWhat book would you like to check in?")
    currentInput = io.getInput()
    if libraryOut.keys.contains(currentInput) {
    print("\nYou have checked in \(currentInput)! Thank you!\n")
    libraryCurrent[currentInput] = "Last Checked In: \(date)"
    libraryOut.removeValue(forKey: currentInput)
    } else {
    print("\nThis book is not checked out!\n")
    }
}
    func addBook() {
    io.writeMessage("\nWhat book would you like to add?")
    currentInput = io.getInput()
    if library.keys.contains(currentInput) {
    print("\nThis book is already in the library!\n")
    } else {
    let title = currentInput
    io.writeMessage("\nWho is the author?")
    currentInput = io.getInput()
    let author = currentInput
    let bookTotal = title + " - by " + author
    libraryCurrent[title] = "Checked In"
    library[bookTotal] = "Checked In"
    print("\nYou have added the book \(bookTotal) to the library!\n")
    }
    }
}
