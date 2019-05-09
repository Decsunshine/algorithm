//
//  ViewController.m
//  String_OC
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, assign) NSUInteger loc;
@property(nonatomic, assign) NSUInteger length;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@", [self exchange:@"aaabbccadd"]);
//    [self stringOperation];
//   NSLog(@"%@", [self longestPalindrome:@"acb3bd"]);
//    NSLog(@"%d", [self atoi:@"   123"]);
//    NSLog(@"%d", [self atoi:@"-42"]);
//    NSLog(@"%d", [self atoi:@"words and 987"]);
//    NSLog(@"%d", [self atoi:@"-91283472332"]);
//    NSLog(@"%d", [self atoi:@"4193 with words"]);
//    [self arrange:@"abc"];
//    NSLog(@"%@", [self reverseString:@"the sky is blue"]);
    NSLog(@"%@", [self reverseString:@"  hello world!  "]);
//    NSLog(@"%@", [self reverseString:@"a good   example"]);
}

- (void)stringOperation
{
    //字符串的查找
    NSString *string1 = @"www.iphonetrain.com/ios.html";
    NSRange rang = [string1 rangeOfString:@"ios"];
    NSLog(@"%lu - %lu", (unsigned long)rang.location, (unsigned long)rang.length);
    
    // 字符串截取
    NSString *address = @"www.baidu.com";
    NSString *str1 = [address substringToIndex:3];
    NSLog(@"%@", str1);
    
    NSString *str2 = [address substringFromIndex:4];
    NSLog(@"%@", str2);
    
    NSRange range = {0, 4};
    NSString *str3 = [address substringWithRange:range];
    NSLog(@"%@", str3);
    
    //字符串转换成数组:
    NSString * str4 = @"www.itacast.cn";
    NSArray * strArray = [str4 componentsSeparatedByString:@"."];
    NSLog(@"strArray %@",strArray);
    
    //判断字符串是否以指定的内容开头
    NSString * str5 = @"www.baidu.com";
    BOOL isPerfix = [str5 hasPrefix:@"www"];
    NSLog(@"%d", isPerfix);
    
    //判断字符串是否以指定的内容结尾；在开发中中常用来判断文件格式
    BOOL isSuffix = [str5 hasSuffix:@".txt"];
    NSLog(@"%d", isSuffix);
    
    NSString *str6 = @"  www.baidu.com   ";
    NSString *str7 = [str6 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(@"%@", str7);
    
    //使用新的字符,替换原有的字符
    NSString * str8 = @"www.baidu.cn";
    NSString * str9 = [str8 stringByReplacingOccurrencesOfString:@"cn" withString:@"com"];
    NSLog(@"%@", str9);
    
    //在指定的范围追加字符串
    NSString * str10 = @"www.cn";
    NSRange range1 = {4,0};
    //location代表的是从哪个索引开始插入,length 代表的意思可以覆盖几个字符
    NSString * str11 = [str10 stringByReplacingCharactersInRange:range1 withString:@"baidu."];
    NSLog(@"%@", str11);
    
    //字符串的末尾追加新的字符
    NSString * str12 = @"www.";
    NSString * str13 = [str12 stringByAppendingString:@"baidu.com"];
    NSLog(@"%@", str13);
    
    //你写入文件的时候,使用的是什么编码格式,读取的时候就要给我用什么编码格式
    NSString * path = @"/Users/aplle/Desktop/mytest.txt";
    NSError * error;
    NSString * str14 = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"%@", str14);
    
    //去除两端的空格
    [str12 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    //去除回车
    [str12 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    
    //去除@符号和双引号
    [str12 stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@\""]];
     
    //将string字符串转换为array数组
    NSArray  *array = [str12 componentsSeparatedByString:@","];
    NSLog(@"%@", array);
    
    //将array数组转换为string字符串
    NSString *tempString = [array componentsJoinedByString:@","];
    NSLog(@"%@", tempString);
}

// 给一个字符串如 aaabbccadd，输出 a3b2c2a1d2
- (NSString *)exchange:(NSString *)input
{
    if (!input || input.length < 0) {
        return @"";
    }
    NSString *result = @"";
    NSInteger index = - 1;
    NSInteger currentCount = 0;
    NSInteger stringLength = input.length - 1;
    
    while (index < stringLength) {
        index = index + 1;
        NSRange range = {index, 1};
        NSString *str = [input substringWithRange:range];
    
        if (result.length <= 0) {
            result = [NSString stringWithFormat:@"%@", str];
            currentCount = 1;
        } else if (![[result substringFromIndex:(result.length - 1)] isEqualToString:str]) {
            result = [NSString stringWithFormat:@"%@%ld%@", result, (long)currentCount, str];
            currentCount = 1;
        } else {
            currentCount = currentCount + 1;
        }
        if (index == stringLength && currentCount > 0) {
            result = [NSString stringWithFormat:@"%@%ld", result, (long)currentCount];
        }
    }
    
    return result;
}

// Input: "babad"
// Output: "bab"
- (NSString *)longestPalindrome:(NSString *)string
{
    if (string.length <= 0) {
        return @"";
    }
    if (string.length == 1) {
        return string;
    }
    
    NSRange range = {0, 0};
    for (int i = 0; i < string.length - 1; i ++) {
        range = [self isPalindromeString:string :i :i :range];
        range = [self isPalindromeString:string :i :i + 1 :range];
    }
    return [string substringWithRange:range];
}

- (NSRange)isPalindromeString:(NSString *)string :(int)low :(int)high :(NSRange)range
{
    while ((low >= 0) && (high <= (string.length - 1))){
        NSRange lowRang = {low, 1};
        NSRange highRang = {high, 1};
        if ([(NSString *)[string substringWithRange:lowRang] isEqualToString:(NSString *)[string substringWithRange:highRang]]) {
            low = low - 1;
            high = high + 1;
        } else {
            break;
        }
    }
    
    if (high - low - 1 > range.length) {
        range.length = high - low - 1;
        range.location = low + 1;
    }
    return range;
}


// 字符串转数字
- (int)atoi:(NSString *)string
{
    // 1. 转化过之后，符号位超限
    // 2. 注意符号
    // 3. 去除空格
    // 4. 如果首位不是数字，报错
    // 5. 如果后面不是数字舍去
    long result = 0;
    int index = 0;
    BOOL negative = NO;
    BOOL exception = YES;
    
    while (index < string.length) {
        NSRange range = {index, 1};
        NSString *charI = [string substringWithRange:range];
        if ([charI isEqualToString:@" "]) {
            
        } else if ([charI isEqualToString:@"-"]) {
            negative = YES;
        } else if ([charI isEqualToString:@"+"]) {
            
        } else if ([self isNum:charI]) {
            result = result * 10 + (negative ? -[charI intValue] : [charI intValue]);
            exception = NO;
        } else {
            if (result == 0 && exception) {
                return 0;
            } else {
                return (int)result;
            }
        }
        
        if (result < INT_MIN) {
            return INT_MIN;
        } else if (result > INT_MAX) {
            return INT_MAX;
        }
        
        index ++;
    }
    
    return (int)result;
}

- (BOOL)isNum:(NSString *)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];;
}


// 字符串全排列
- (void)arrange:(NSString *)string
{
    if (string.length <= 0) {
        NSLog(@"%@", string);
    }
    
    [self recursiveArrange:string index:0];
}

- (void)recursiveArrange:(NSString *)string index:(int)index
{
    if (string.length == index) {
        NSLog(@"%@", string);
    }
    
    for (int i = index; i < string.length; i++) {
        string = [self swapString:string firstIndex:index secondIndex:i];
        [self recursiveArrange:string index:(index + 1)];
        string = [self swapString:string firstIndex:index secondIndex:i];
    }
}

- (NSString *)swapString:(NSString *)string firstIndex:(int)firstIndex secondIndex:(int)secondIndex
{
    if (firstIndex == secondIndex) {
        return string;
    }
    NSRange firstRange = {firstIndex, 1};
    NSString *firstString = [string substringWithRange:firstRange];
    NSRange secondRange = {secondIndex, 1};
    NSString *secondString = [string substringWithRange:secondRange];
    NSString *preString = [string substringToIndex:firstIndex];
    NSRange middleRange = {(firstIndex + 1), (secondIndex - firstIndex - 1)};
    NSString *middleString = [string substringWithRange:middleRange];
    NSString *suffixString = [string substringFromIndex:(secondIndex + 1)];
    
    string = [NSString stringWithFormat:@"%@%@%@%@%@", preString, secondString, middleString, firstString, suffixString];
    return string;
}


// Reverse Words in a String
- (NSString *)reverseString:(NSString *)string
{
    if (string.length <= 0) {
        return @"";
    }
    if (string.length == 1) {
        return string;
    }
    
    __block NSMutableString *resultString = nil;
    NSArray *array = [string componentsSeparatedByString:@" "];
    [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *string = (NSString *)obj;
        if (![string isEqualToString:@""]) {
            if (resultString) {
                [resultString appendString:[NSString stringWithFormat:@" %@", string]];
            } else {
                resultString = [NSMutableString stringWithString:string];
            }
        }
    }];
    return [resultString copy];
}
@end
