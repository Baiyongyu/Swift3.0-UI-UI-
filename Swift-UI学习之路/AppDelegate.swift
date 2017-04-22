//
//  AppDelegate.swift
//  Swift-UI学习之路
//
//  Created by 宇玄丶 on 2017/4/21.
//  Copyright © 2017年 qianmo. All rights reserved.
//

//import 是导入文件/库的关键字，相当于c语言中的include
//UIKit是iOS中所有的控件所在的库文件
import UIKit
//UIApplicationMain：
//1.创建了一个UIApplication对象，代表当前应用程序，主要作用是用来检测当前应用程序状态的改变
//2.创建了一个遵守UIApplicationDelegate的协议的子类对象作为UIApplication的代理，作用是处理应用程序状态的改变(创建AppDelegate的对象并且设置为UIApplication对象的代理)
@UIApplicationMain //调用了OC中的UIApplicationMain函数；它是ios应用程序的入口

//创建AppDelegate的对象并且设置为UIApplication对象的代理
class AppDelegate: UIResponder, UIApplicationDelegate {

    //UIWindow:UIView
    //window:窗口，一个应用想要展示在屏幕上，至少要有一个window.一个手机应用程序一般只有一个window
    //应用程序中的所有的界面全部是展示在window上的
    var window: UIWindow?

    //当应用程序启动成功后会自动调用这个方法
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //在这个方法中来：
        //        1.搭建应用程序中所有的界面
        //        2.获取应用程序需要展示的数据
        //        3.使用界面展示数据
        //注意：如果不在这个方法中去创建window，那么程序会通过Main.storyboard去创建应用程序界面
        print("启动应用程序")
        
        //需要注意的是：
        //1>Swift3.0之后获取屏幕尺寸已修改为UIScreen.main.bounds，"UIScreen.mainScreen().bounds"不在使用
        //2>创建颜色已修改为UIColor.yellow，不在使用"UIColor.yellowColor()"
        
        //1.创建UIWindow对象
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        //2.设置根视图控制器
        //不需要导入头文件，直接可以调用，具体什么鬼，我也不知道；但是我导入头文件import ViewController会报错的。
        self.window?.rootViewController = ViewController()
        
        //3.设置背景颜色
        self.window?.backgroundColor = UIColor.yellow
        
        return true
    }

    //当应用程序将要成为非活跃状态的时候会自动调用这个方法。
    //    活动状态：程序在屏幕上可见
    //    非活跃状态：程序没有显示在屏幕上(常见三种情况：1.按home键进入后台 2.来电打断  3.在当前应用程序中打开其他应用程序)
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        //在这个方法中一般是用来保存数据，比如暂停播放，保存播放时间位置，暂停游戏等等
        print("程序将要成为非活跃状态")
    }

    //当应用程序已经进入后台的时候会自动调用(进入后台只有按home键)
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        //在这个方法中一般是用来保存数据，比如暂停播放，保存播放时间位置，暂停游戏等等(和applicationWillResignActive方法可以选一个实现就可以了)
        print("应用程序进入后台")
    }

    //应用程序将要进入前台的时候会自动调用
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
        print("应用程序将要进入前台")
    }

    //应用程序已经变成活跃状态的时候会自动调用(常见三种情况：1.程序启动之后  2.程序从后台重新进入前台   3.来电打断结束)
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        print("应用已经成为活跃状态")
    }

    //应用程序将要终止的时候会自动调用
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        print("应用程序将要终止")
    }


}

