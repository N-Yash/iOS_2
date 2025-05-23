//
//  FileStructure.swift
//  Week3_Lists
//
//  Created by Jigisha Patel on 2025-05-23.
//

import Foundation

struct FileStructure: Hashable, Identifiable {
    let id = UUID()
    var title: String
    let isFolder: Bool
    var children: [FileStructure]? = nil
    
    static func getSampleFileStructure() -> [FileStructure] {
        [
            FileStructure(title: "Inbox", isFolder: true, children: [
                FileStructure(title: "Important", isFolder: false),
                FileStructure(title: "Non Important", isFolder: false)
            ]),
            FileStructure(title: "Archived", isFolder: true, children: [
                FileStructure(title: "Work", isFolder: true, children: [
                    FileStructure(title: "Assignments", isFolder: false),
                    FileStructure(title: "Tests", isFolder: false)
                ])
            ]),
            FileStructure(title: "Junk", isFolder: false),
            FileStructure(title: "Spam", isFolder: false)
        ]
    }
}

