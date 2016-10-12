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
    private var lib = Library()
    
    
    func go() {
        while !done {
            
            io.writeMessage("\nWelcome to Library Mach 5! Type 'Help' to see a list of actions that you can do! Otherwise, input an action!")
            currentInput = io.getInput()
            let selection = currentInput
            switch selection {
            case "Help":
                print("\nHere is a list of available actions for the library: \n\nList: Alphabetically lists the books currently existing in the library. \nListAvailable: Lists the books current available to be checked out. \nListCheckedOut: Lists the books currently checked out of the library. \nAdd: Adds a new book to the library. \nCheckIn: Checks a book back into the library. \nCheckOut: Checks a book out of the library. \nHelp: Brings up this help menu. \nQuit: Quits the library program. \n")
            case "q":
                done = true
            case "List":
                let sortedAll = lib.library.keys.sorted().joined(separator: "\n")
                print("\nThe books in the library are:\n\(sortedAll) \n")
            case "ListAvailable":
                let libCurrentSort = lib.libraryCurrent
                    .sorted { $0.0 < $1.0 }
                    .map { $0 + " : " + $1 }
                    .joined(separator: "\n")
                print("\nThe books currently available for check out in the library are:\n\(libCurrentSort) \n")
            case "ListCheckedOut":
                let libOutSort = lib.libraryOut
                    .sorted { $0.0 < $1.0 }
                    .map { $0 + " : " + $1 }
                    .joined(separator: "\n")
                print("\nThe books currently checked out of the library are:\n\(libOutSort) \n")
            case "Add":
                lib.addBook()
            case "CheckOut":
                lib.checkOut()
            case "CheckIn":
                lib.checkIn()
            case "Quit":
                print("Thank you for using Library Mach 5!")
                done = true
            default:
                print("\nPlease choose an action!\n")
            }
        }
    }

    }
