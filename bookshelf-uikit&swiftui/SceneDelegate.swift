//  SceneDelegate.swift
//  Created by user on 20/01/2025.

import UIKit


enum WindowCase: String {
    case reg, onboarding, main
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Our Notification to set "Preview" -> "Reg" OR "Main" ViewControllers in SceneDelegate
        NotificationCenter.default.addObserver(self, selector: #selector(windowManager), name: .windowManager, object: nil)
        
        // Установили "PreviewView" в качестве первого ViewContoller (первым отображается при запуске)
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        self.window?.rootViewController = PreviewView()
        self.window?.makeKeyAndVisible()
    }

    
    // Our func  -> UIViewController
    // add @objc - because will call func via Notification (in UIKit?)
    // window: WindowCase
    @objc func windowManager(notification: Notification) {
        
        // Просто передаем сюда нужное значение и меняем наш RootController😎
        
        guard let userInfo = notification.userInfo as? [String: WindowCase] else { return }
        
        // Отлавливаем, на какой экран мы будем переходить
        guard let window = userInfo[.windowInfo] else { return }
        
        // Переключаемся между View!
        switch window {
        case .reg:
            self.window?.rootViewController = Builder.createRegistrationView()
        case .onboarding:
            self.window?.rootViewController = Builder.createOnboardingView()
        case .main:
            self.window?.rootViewController = Builder.createMainView()
        }
        
    }

}

