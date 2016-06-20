//
//  main.m
//  BubbleTest
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


long TailRescuvie(long n, long a) {
    
    return (n == 1) ? a : TailRescuvie(n - 1, a * n);
    
}


long TailRes(long n) {//封装用的
    
    return (n == 0) ? 1 : TailRescuvie(n, 1);
    
}



long sssss(long n, long a){
    
    return n == 0? a : sssss(n - 1, n + a);
}

long sad(long n){
    
    return n == 0 ? 0 : sssss(n, 0);
}


long sumNum (long n){
    
    return n == 0 ? 0 : n + sumNum(n - 1);
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"%ld",sad(5));
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
