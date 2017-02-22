//
//  LXFNetObserverHelper.h
//  LXFNetObserve
//
//  Created by 蓝潇枫 on 2017/2/22.
//  Copyright © 2017年 lanxiaofeng. All rights reserved.
//

#import <Foundation/Foundation.h>
 

typedef NS_ENUM(NSUInteger, LXFNetworkStatus) {
    LXFNetworkStatusNotReachable = 0,//网络不可用
    LXFNetworkStatus3G = 3, //3G网络
    LXFNetworkStatus4G, //4G网络
    LXFNetworkStatusWIfI //WIFI
};

@interface LXFNetObserverHelper : NSObject

/**
 单例

 @return 单例对象
 */
+ (instancetype)sharedInstance;

/**
 开始监听网络
 */
- (void)startListening:(void (^) (LXFNetworkStatus status))block;

/**
 停止监听网络
 */
- (void)stopListening;

@end
