# Swift3.0-UI-UI-
Swift3.0-UI学习之路之基础UI篇，简单介绍了一些常用的UI控件使用方法

#概述

用了好些时间了解了一下Swift的语法，有人说Swift很简单，其实在我看来，Swift有其简单之处，也有其复杂之处，但我们应该注重的是学习Swift的语言之美！接下来开始进入UI的学习阶段。
iOS开发过程中系统提供了很多UI相关的类，由于并不是完全了解，就慢慢摸索吧，我就是想着按照学习OC的方式来一步步开展我的Swift学习之路！
感谢：
http://www.jianshu.com/p/d789d46c43fc
http://www.jianshu.com/p/0f120d3c88b1#    http://www.jianshu.com/p/c7ed6ffb4694 
的分享。
![Swift Programming Language](http://upload-images.jianshu.io/upload_images/5684426-96e4f5f6eea09ec3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
Swift毕竟跟OC都是用来开发iOS应用的，所以UI控件都是一样的。

![UI控件](http://upload-images.jianshu.io/upload_images/5684426-989dab2c8ecc542b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
一切还是从打开Xcode开始：

![创建一个工程](http://upload-images.jianshu.io/upload_images/5684426-49887e899b914095.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
跟创建一个OC工程一样，只不过Labguage改成Swift就可以了。
###AppDelegate.swift文
```
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
```

---
#创建一个Window窗口
```
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
         1>Swift3.0之后获取屏幕尺寸已修改为UIScreen.main.bounds，"UIScreen.mainScreen().bounds"不在使用
         2>创建颜色已修改为UIColor.yellow，不在使用"UIColor.yellowColor()"

        //1.创建UIWindow对象
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        //2.设置根视图控制器
        //这里也需要注意，跟控制器是UIViewController，而不是ViewController，
        //不需要导入头文件，直接可以调用，具体什么鬼，我也不知道；但是我导入头文件import ViewController会报错的。
        self.window?.rootViewController = ViewController()
        //3.设置背景颜色
        self.window?.backgroundColor = UIColor.yellow
        
        return true
    }
```

![这是一个Window](http://upload-images.jianshu.io/upload_images/5684426-f72382389a4b0dbd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#UIView
简单常用的一些方法，掌握这些基本都是够用的。Swift3.0之后方法变化很大，使用时多查看用法。其实只要是学过OC的小伙伴，上手还是很快的，方法基本还是那些方法，只不过是换了书写方式，其余的自己动手多敲敲就都出来了。至于UIView的动画以后再做研究吧。
```
        let view = UIView()
        view.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        view.center = CGPoint(x: 200, y: 200)
//        view.backgroundColor = UIColor.green
        view.backgroundColor = UIColor.init(white: 0.5, alpha: 1)
        
        //transform(形变)
        //缩放
        view.transform = CGAffineTransform(scaleX: 0.8, y: 2.5)
        //旋转
        //参数:旋转角度(圆周率对应的角度值)
        view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4 / 2))
        
        view.tag = 10
        
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 5
        
        //获取一个视图的父视图
        let superView = view.superview
        superView?.backgroundColor = UIColor.black
        
        //获取一个视图的所有的子视图
        let subViews = self.view.subviews
        print(subViews)
        
        
        self.view.addSubview(view)
```
效果图：

![这是创建的UIView](http://upload-images.jianshu.io/upload_images/5684426-2fd76aa15a0ef3e8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#UILabel
```
        //根据文字设置label的大小
        let str = "qwertyuiop[asdfghjklweqwertyui欧普qwertyu iop[3ertyuiop rtyuiopsdfghjkrtyuio"
        //计算显示指定文字所需要的最小空间
        //1.将swift的字符串转换成OC的字符串
        let ocStr = str as NSString
        //2.计算字符串的大小
        //参数1:限制显示当前字符串的最大宽度和最大高度
        //参数2:设置渲染方式(UsesLineFragmentOrigin)
        //参数3:确定文字的字体(大小)
        //NSFontAttributeName ->字体对应的key值
        //NSForegroundColorAttributeName -> 文字颜色对应的key值
        
        let strSize = ocStr.boundingRect(with: CGSize(width: 300, height: 1000000000), options: NSStringDrawingOptions(rawValue: 1), attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 17)], context: nil).size
        print(strSize)
        
        
        let lb = UILabel()
        lb.frame = CGRect(x: 20, y: 80, width: 100, height: 30)
//        lb.text = "这是一个label"
        lb.numberOfLines = 0
        lb.textColor = UIColor.red
        lb.backgroundColor = UIColor.white
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.shadowColor = UIColor.black
        lb.textAlignment = .center
        lb.shadowOffset = CGSize(width: -1, height: 1)
        
        
        lb.text = str
        //之前方法是这样的，但是现在并没有实现效果，不知道咋搞。
        
        self.view.addSubview(lb)
```
效果图：

![这是创建的UILabel](http://upload-images.jianshu.io/upload_images/5684426-eb3c2ca91f20d249.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#UIImageView
```
        let img = UIImageView()
        img.frame = CGRect(x: 70, y: 150, width: 60, height: 60)
        //a.通过图片名去创建一个图片对象(注意:如果图片的格式是png，那么图片名的后缀可以省略。但是其他格式的图片的图片名的后缀不能省略)
        //img.image = UIImage.init(named: "img")
        
        //b.通过图片路径去创建一个图片对象
        //将文件(除了swift文件)放到工程中，实质是放到了当前应用程序的包文件中
        //（想要拿到工程中的图片路径先要获取包文件;）
        
        //拿到包中的指定的文件的路径
        let imagePath = Bundle.main.path(forResource: "img", ofType: "png")
        img.image = UIImage.init(contentsOfFile: imagePath!)
        
        //c.比较通过图片名和通过图片地址创建图片对象的两种方法:
        //(1).通过图片名创建的图片对象在程序结束后才会被销毁,只会创建一次；通过图片地址创建图片对象是当前图片对象不再使用的时候就销毁
        //(2)使用图片名创建图片的情况:创建小图标的时候；在工程中会重复使用的图片
        //(3)使用图片地址创建图片对象的情况:不会频繁的在多个界面出现的大图
        
        //内容模式
        img.contentMode = .scaleToFill
        
        self.view.addSubview(img)
```

![这是创建的UIImageView](http://upload-images.jianshu.io/upload_images/5684426-be9e028b17470bf3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#UIButton
```
        let btn = UIButton()
        btn.frame = CGRect(x: 100, y: 250, width: 200, height: 40)
        btn.setTitle("这是一个按钮", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.backgroundColor = UIColor.white
//        btn.setImage(UIImage.init(named: "img"), for: .normal)
//        btn.setBackgroundImage(UIImage.init(named: "img"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.titleLabel?.textAlignment = .center
        //需要注意的是：Swift3.0之后对于按钮的点击事件的写法变化很大。
        // #selector(ViewController.addview(_:)这么写真心感觉别扭，目前还没有理解这么写的美感，慢慢体会吧。
        // ViewController：我理解的应该就是所在的控制器
        // addView：我理解的应该就是按钮的点击方法名
        // 注意： _ 如果这里写的是这个下划线，那么在func里面也是对应的_，如果换成随便起的名字，那么func里面也要对应上。
        btn.addTarget(self, action: #selector(ViewController.addview(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
// 按钮点击事件
   func addview(_ sender:UIButton) {
       print("点击了按钮")
   }
```

![这是创建的UIButton](http://upload-images.jianshu.io/upload_images/5684426-0cd3ff0848dc93c4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#UITextField
常用方法：
```
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 300, width: 300, height: 44)
//        textField.text = "这是一个输入框"
        textField.placeholder = "请输入账号"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.returnKeyType = .go
        
        let leftImg = UIImageView()
        leftImg.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        leftImg.image = UIImage.init(named: "img")
        textField.leftView = leftImg
        textField.leftViewMode = .always
            
        self.view.addSubview(textField)
```
代理UITextFieldDelegate：
```
    //参数：当前这个协议对应的委托方
    //当文本输入框已经开始编辑的时候会自动调用这个方法
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("已经开始编辑")
    }
    
    //当文本框将要结束的时候自动调用这个方法
    //返回值：设置当前的TextField是否可以结束编辑(默认是true)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //例如要求文本框的文本长度大于等于11才能结束
        if (textField.text?.characters.count)! >= 11{
            return true
        }
        return false
    }
    
    //当文本框已经结束编辑(光标消失)的时候自动调用这个方法
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("已经结束编辑")
    }
    
    //当TextField弹出来的键盘按键被点击时会自动调用
    //参数2：当前输入字符所在的位置
    //参数3：当前输入的字符串(字符转换成的字符串)
    //返回值：是否可以改变TextField的text的值(默认true)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //        print(range)
        //        print(string)
        if string == "0"{
            print("sb")
        }
        return true //可以改变TextField的text的值
        //return false 不可以改变TextField的text的值
    }
    
    //点击回车按钮
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("返回按钮被点击")
        //收起键盘(结束编辑)
        //1.放弃第一响应者
        textField.resignFirstResponder()
        //2.直接让指定的textField结束编辑
        textField.endEditing(true)
        //3.让self.view上的所有的子视图都结束编辑
        self.view.endEditing(true)
        return true
    }
    
    //返回值：设置当前TextField是否可以进行编辑(默认为true)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true //可以编辑
        // return false 不能处于编辑状态(不能进行编辑)，鸡肋方法，基本不会用这个方法
    }
    
    //设置文本是否能被清除，默认true，鸡肋方法，一般不用
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
```

![这是创建的UITextField](http://upload-images.jianshu.io/upload_images/5684426-eaba35d4787faaab.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#UITextView
```
        let textView = UITextView()
        textView.frame = CGRect(x: 50, y: 350, width: 300, height: 100)
        textView.text = "这是一个textView"
//        属性和TextField基本一致，不再累赘。
        self.view.addSubview(textView)
```

![这是创建的UITextView](http://upload-images.jianshu.io/upload_images/5684426-493d1637d1224f98.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#UIAlertViewController
```
        // 风格1：
        let alert = UIAlertController(title: "这是一个弹框", message: "亲、么么哒~", preferredStyle: .alert)
        let sure = UIAlertAction(title: "确定", style: .destructive) { (alert:UIAlertAction) in
            print("确定")
            // 风格2：
            //1.创建表单视图
            //参数1：标题，参数2：信息
            //参数3：风格 .Alert - 警告框  .actionSheet - 表单视图
            let alterController = UIAlertController(title: "标题", message: "消息", preferredStyle: .actionSheet)
            
            //2.添加到界面上
            //参数1：需要显示的试图控制器，参数2：是否需要动画， 参数3：显示完成后需要做什么
            self.present(alterController, animated: true, completion: nil)
            //添加按钮
            //参数1：当前选项对应按钮上的文字
            //参数2：风格 .default - 连在一起  .cancel - 单独分开显示  .destructive - title显示颜色是红色
            //参数3：当按钮点击后需要做什么
            let action = UIAlertAction(title: "按钮", style: .destructive, handler: nil)
            alterController.addAction(action)
        }
        
        let cancle = UIAlertAction(title: "取消", style: .cancel) { (alert:UIAlertAction) in
              print("取消")
        }

        alert.addAction(sure)
        alert.addAction(cancle)
        self.present(alert, animated: true, completion: nil)
```

![这是一个弹框](http://upload-images.jianshu.io/upload_images/5684426-33359187b8f82c51.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#UIDatePicker
创建一个UIDatePicker
```
        let datePicker = UIDatePicker()
        datePicker.center = CGPoint(x: 200, y: 620)
        datePicker.tag = 1
        self.view.addSubview(datePicker)
```
取到当前选中的日期
```
        //这里没有写取消、确定按钮，处于省事就这么写了，原理是一样的;
        //如果好好写一个picker的话，也是这样的用法取到“dateAndTime”就是当前选中的日期
        
        let datePicker = self.view.viewWithTag(1) as! UIDatePicker
        //获取日期拾取起的日期值
        let date = datePicker.date
        //新建一个日期格式化对象，用来实现日期的格式化
        let dateFormater = DateFormatter()
        //设置日期的格式,大写的H表示采用24小时制
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
        //将日期转换为指定格式的字符串
        let dateAndTime = dateFormater.string(from: date)
        
        let alert = UIAlertController(title: "当前选中的时间", message: dateAndTime, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
```

![这是一个UIDatePicker](http://upload-images.jianshu.io/upload_images/5684426-6e666c2d697ee567.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
好了，常用的基本UI控件也就是这些，像那些什么
UISegmentedControl 、UIStepper、UISlider也不怎么用，我也没看，需要用到的话再看吧，还是那句话，会OC的，掌握非常快，只是换个了写法而已。
接下来，就要学习控制器之类的了，另开一篇文章。
如果您觉得我的文章帮到了你，记得给个Star啊^_^
