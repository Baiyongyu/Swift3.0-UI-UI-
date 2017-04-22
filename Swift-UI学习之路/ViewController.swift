//
//  ViewController.swift
//  Swift-UI学习之路
//
//  Created by 宇玄丶 on 2017/4/21.
//  Copyright © 2017年 qianmo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //-----------------------------UIView----------------------------------------------
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
        
        
        //-----------------------------UILable----------------------------------------------
        
        
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
        
        //-----------------------------UIImageView----------------------------------------------
        
        let img = UIImageView()
        img.frame = CGRect(x: 70, y: 150, width: 60, height: 60)
        //a.通过图片名去创建一个图片对象(注意:如果图片的格式是png，那么图片名的后缀可以省略。但是其他格式的图片的图片名的后缀不能省略)
//        img.image = UIImage.init(named: "img")
        
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
        
        //-----------------------------UIButton----------------------------------------------
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
        
        //-----------------------------UITextField----------------------------------------------
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
        
        //-----------------------------UITextView----------------------------------------------
        let textView = UITextView()
        textView.frame = CGRect(x: 50, y: 350, width: 300, height: 100)
        textView.text = "这是一个textView"
//        属性和TextField基本一致，不再累赘。
        self.view.addSubview(textView)
        
        
        //-----------------------------UIDatePicker----------------------------------------------
        let datePicker = UIDatePicker()
        datePicker.center = CGPoint(x: 200, y: 620)
        datePicker.tag = 1
        self.view.addSubview(datePicker)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
        
    }
    
    
    func addview(_ sender:UIButton) {
        print("点击了按钮")
        
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
        
        
        
        
    }
    
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

