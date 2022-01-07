//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2022/01/01.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject private var todoModel = TodoModel()
    var body: some Scene {
        WindowGroup {
            TodoList(selectedTab: TaskStatus.new)
                .environmentObject(todoModel)
        }
    }
}
