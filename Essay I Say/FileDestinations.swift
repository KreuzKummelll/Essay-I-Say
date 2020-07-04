//
//  FileDestinations.swift
//  Essay I Say
//
//  Created by Andrew on 04.07.20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

final class FileDestinations {
    var developerDirectory = URL(fileURLWithPath: "/Users/andrew/Developer/")
    
    func finalizePath(fileName: String) {
        developerDirectory.appendPathComponent(fileName)
    }
    
    func returnFinalPath() -> URL {
        return developerDirectory
    }
}


