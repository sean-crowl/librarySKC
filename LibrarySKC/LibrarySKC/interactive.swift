//
//  interactive.swift
//  LibrarySKC
//
//  Created by Sean Crowl on 10/10/16.
//  Copyright © 2016 Interapt. All rights reserved.
//

import Foundation

class Interactive {
    private var done: Bool = false
    private var currentInput: String = ""
    private var io = Io()
    
    var library:Set<String> = ["Book 1", "Book 2", "Book 3", "Book 4", "Book 5"]
    var libraryCurrent:Set<String> = ["Book 1", "Book 2", "Book 3", "Book 4", "Book 5"]
    var libraryOut:Set<String> = []
    
    func go() {
        while !done {
            
            io.writeMessage("\nWelcome to Library Mach 5! Type 'Help' to see a list of actions that you can do! Otherwise, input an action!")
            currentInput = io.getInput()
            let selection = currentInput
            switch selection {
            case "Help":
                print("\nHere is a list of available actions for the library: \n\nList: Lists the books currently existing in the library. \nListAvailable: Lists the books current available to be checked out. \nListCheckedOut: Lists the books currently checked out of the library. \nAdd: Adds a new book to the library. \nCheckIn: Checks a book back into the library. \nCheckOut: Checks a book out of the library. \nHelp: Brings up this help menu. \nQuit: Quits the library program. \n")
            case "List":
                print("\nThe books in the library are: \(library) \n")
            case "ListAvailable":
                print("\nThe books currently available for check out in the library are: \(libraryCurrent) \n")
            case "ListCheckedOut":
                print("\nThe books currently checked out of the library are: \(libraryOut) \n")
            case "Add":
                io.writeMessage("\nWhat book would you like to add?")
                currentInput = io.getInput()
                if library.contains(currentInput) {
                    print("\nThis book is already in the library!\n")
                } else {
                library.insert(currentInput)
                libraryCurrent.insert(currentInput)
                print("\nYou have added the book \(currentInput) to the library!\n")
                }
            case "CheckOut":
                io.writeMessage("\nWhat book would you like to check out?")
                currentInput = io.getInput()
                if libraryCurrent.contains(currentInput) {
                    print("\nYou have checked out \(currentInput)!\n")
                libraryCurrent.remove(currentInput)
                libraryOut.insert(currentInput)
                } else {
                    print("\nUnfortunately, this book is already checked out!\n")
                }
                case "CheckIn":
                io.writeMessage("\nWhat book would you like to check in?")
                currentInput = io.getInput()
                if libraryOut.contains(currentInput) {
                    print("\nYou have checked in \(currentInput)! Thank you!\n")
                    libraryCurrent.insert(currentInput)
                    libraryOut.remove(currentInput)
                } else {
                    print("\nThis book is not checked out!\n")
                }
            case "Quit":
                print("Thank you for using Library Mach 5!")
                done = true
            default:
                print("\nPlease choose an action!\n")
            }
        }
    }

    }
