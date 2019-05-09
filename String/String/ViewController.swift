//
//  ViewController.swift
//  String
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // string 增
        // 拼接
        let str = "hello ";
        let wall = str + "world";
        print(wall);
        
        let yiyong = "\("women"),age is,\(100)";
        
        print(yiyong);
        
        let num = 25;
        let m = "man";
        let strTest = "james age is \(num) a \(m)";
        print(strTest)
        
        // 删
        
        // 改
        // 字符串改为整型
        let myString: String = "256"
        let myInt: Int? = Int(myString)
        print( "\(myInt ?? 0)" )
        
        
        // 查
        // 字符串长度
        let varURL   = " http://www.baidu.com"
        print( "\(varURL), 长度为 \(varURL.count)" )
        
        // 前缀查找
        let resultPrefix = varURL.hasPrefix(" http")
        print( "\(resultPrefix)")
        
        // 后缀查找
        let resultSuffix = varURL.hasSuffix("com")
        print( "\(resultSuffix)")
        
        // 子串查找
        let resultContain = varURL.contains("baidu.com")
        print( "\(resultContain)" )

        
        // 比较
        let varA   = "Hello, Swift!"
        let varB   = "Hello, World!"
        
        if varA == varB {
            print( "\(varA) 与 \(varB) 是相等的" )
        } else {
            print( "\(varA) 与 \(varB) 是不相等的" )
        }
        
    }
    
    // string to int
    func myAtoi(_ str: String) -> Int {
        // 1 空
        // 2 正负号
        // 3 非数字
        // 4 字符超限问题
        // 5 参数 0 与返回非法需要区别
        var result = 0
        var onlyDigit = false
        var sign = 1
        
        for char in str {
            switch char {
            case " ":
                if onlyDigit {
                    return result
                } else {
                    continue
                }
            case "+":
                fallthrough
            case "-":
                if onlyDigit {
                    return result
                } else {
                    onlyDigit = true
                    sign = char == "+" ? 1 : -1
                }
            case "0"..."9":
                result = (result * 10 + Int(String(char))! * sign)
                onlyDigit = true
                
                if result > Int32.max {
                    return Int(Int32.max)
                } else if result < Int32.min {
                    return Int(Int32.min)
                }
            default:
                return result
            }
            
        }
        
        return result
    }
}

