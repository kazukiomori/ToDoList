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
                        requestAppTrackingTransparencyAuthorization()
                        return true
                    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    private func requestAppTrackingTransparencyAuthorization() {
        if #available(iOS 14.5, *) {
            // .notDeterminedの場合にだけリクエスト呼び出しを行う
            guard ATTrackingManager.trackingAuthorizationStatus == .notDetermined else { return }
            
            // タイミングを遅らせる為に処理を遅延させる
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    // リクエスト後の状態に応じた処理を行う
                })
            }
        }
    }
}

@main
struct ToDoListApp: App {
    @StateObject private var todoModel = TodoModel()
    var body: some Scene {
        WindowGroup {
            TodoList(todoList: .constant(TodoModel().taskList),selectedTab: TaskStatus.new )
                .environmentObject(todoModel)
        }
    }
}
