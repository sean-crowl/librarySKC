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
    
    var library:[String:String] = ["ABook":"Checked In", "BBook":"Checked In", "CBook":"Checked In", "DBook":"Checked In", "EBook":"Checked In"]
    var libraryCurrent:[String:String] = ["ABook":"Checked In", "BBook":"Checked In", "CBook":"Checked In", "DBook":"Checked In", "EBook":"Checked In"]
    var libraryOut:[String:String] = [:]
    
    var date = Date()
    var dueDate = Date(timeIntervalSinceNow: 604800)
    
    
    func go() {
        while !done {
            
            io.writeMessage("\nWelcome to Library Mach 5! Type 'Help' to see a list of actions that you can do! Otherwise, input an action!")
            currentInput = io.getInput()
            let selection = currentInput
            switch selection {
            case "Help":
                print("\nHere is a list of available actions for the library: \n\nList: Alphabetically lists the books currently existing in the library. \nListAvailable: Lists the books current available to be checked out. \nListCheckedOut: Lists the books currently checked out of the library. \nAdd: Adds a new book to the library. \nCheckIn: Checks a book back into the library. \nCheckOut: Checks a book out of the library. \nHelp: Brings up this help menu. \nQuit: Quits the library program. \n")
            case "List":
                let sortedAll = library.keys.sorted()
                print("\nThe books in the library are: \(sortedAll) \n")
            case "ListAvailable":
                print("\nThe books currently available for check out in the library are: \(libraryCurrent) \n")
            case "ListCheckedOut":
                print("\nThe books currently checked out of the library are: \(libraryOut) \n")
            case "Add":
                io.writeMessage("\nWhat book would you like to add?")
                currentInput = io.getInput()
                if library.keys.contains(currentInput) {
                    print("\nThis book is already in the library!\n")
                } else {
                libraryCurrent[currentInput] = "Checked In"
                library[currentInput] = "Checked In"
                print("\nYou have added the book \(currentInput) to the library!\n")
                }
            case "CheckOut":
                io.writeMessage("\nWhat book would you like to check out?")
                currentInput = io.getInput()
                if libraryCurrent.keys.contains(currentInput) {
                print("\nYou have checked out \(currentInput)! Is is due back on \(dueDate).\n")
                libraryCurrent.removeValue(forKey: currentInput)
                libraryOut[currentInput] = "Due Back: \(dueDate)"
                } else {
                    print("\nUnfortunately, this book is unavailable!\n")
                }
                case "CheckIn":
                io.writeMessage("\nWhat book would you like to check in?")
                currentInput = io.getInput()
                if libraryOut.keys.contains(currentInput) {
                    print("\nYou have checked in \(currentInput)! Thank you!\n")
                    libraryCurrent[currentInput] = "Last Checked In: \(date)"
                    libraryOut.removeValue(forKey: currentInput)
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
