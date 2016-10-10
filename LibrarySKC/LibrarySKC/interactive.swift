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
    
    var library:[String] = ["Book 1", "Book 2", "Book 3", "Book 4", "Book 5"]
    
    func go() {
        while !done {
            
            io.writeMessage("\nWelcome to Library Mach 5! Type 'Help' to see a list of actions that you can do! Otherwise, input an action!")
            currentInput = io.getInput()
            var selection = currentInput
            switch selection {
            case "Help":
                print("\nHere is a list of available actions for the library: \n\nList: Lists the books currently in the library. \nAdd: Adds a new book to the library. \nCheckIn: Checks a book back into the library. \nCheckOut: Checks a book out of the library. \nHelp: Brings up this help menu. \nQuit: Quits the library program. \n")
            case "List":
                print("\nThe books currently in the library are: \(library) \n")
            default:
                print("\nPlease choose an action!")
            }
        }
    }

    }
