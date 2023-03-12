//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2022/01/01.
//

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                        GADMobileAds.sharedInstance().start(completionHandler: nil)
                        return true
                    }
}

@main
struct ToDoListApp: App {
    @StateObject private var todoModel = TodoModel()
    var body: some Scene {
        WindowGroup {
            TodoList(todoList: .constant(TodoModel().taskList),selectedTab: TaskStatus.new )
                .environmentObject(todoModel)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in })
                        }
        }
    }
}
