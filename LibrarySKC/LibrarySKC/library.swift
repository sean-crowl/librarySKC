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
    
    var library:[String:String] = ["Hop On Pop":"Checked In", "BBook":"Checked In", "CBook":"Checked In", "DBook":"Checked In", "EBook":"Checked In"]
    var libraryCurrent:[String:String] = ["Hop On Pop":"Checked In", "BBook":"Checked In", "CBook":"Checked In", "DBook":"Checked In", "EBook":"Checked In"]
    var libraryOut:[String:String] = [:]
    
    var date = Date()
    var dueDate = Date(timeIntervalSinceNow: 604800)
    
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
    var title = currentInput
    io.writeMessage("\nWho is the author?")
    currentInput = io.getInput()
    let author = currentInput
    let bookTotal = title + " - by " + author
    libraryCurrent[bookTotal] = "Checked In"
    library[bookTotal] = "Checked In"
    print("\nYou have added the book \(bookTotal) to the library!\n")
    }
    }
}
