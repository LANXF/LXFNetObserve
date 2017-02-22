//
//  LXFNetObserverHelper.m
//  LXFNetObserve
//
//  Created by 蓝潇枫 on 2017/2/22.
//  Copyright © 2017年 lanxiaofeng. All rights reserved.
//

#import "LXFNetObserverHelper.h"
#import "Reachability.h"


@interface LXFNetObserverHelper ()
@property (nonatomic, strong) Reachability *internetReachability;
@property (nonatomic, copy) void(^callBack)(LXFNetworkStatus status);
@end

@implementation LXFNetObserverHelper

+ (instancetype)sharedInstance {
    static LXFNetObserverHelper* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [LXFNetObserverHelper new];
        instance.internetReachability = [Reachability reachabilityForInternetConnection];
    });
    return instance;
}

/**
 开始监听
 */
- (void)startListening:(void (^) (LXFNetworkStatus status))block {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    _callBack = block;
    
    [self currentNetworkStatus];
    [self.internetReachability startNotifier];
}

/**
 停止监听
 */
- (void)stopListening {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    self.internetReachability = nil;
}

/**
 获取网络状态
 */
- (void)currentNetworkStatus {
    switch ([self.internetReachability currentReachabilityStatus]) {
        case NotReachable:
            _callBack(LXFNetworkStatusNotReachable);
            break;
        case ReachableViaWiFi:
            _callBack(LXFNetworkStatusWIfI);
            break;
        case ReachableViaWWAN:
            _callBack(LXFNetworkStatus4G);
            break;
    }
}

/**
 通知调用的方法
 */
- (void)reachabilityChanged:(NSNotification*)noti {
    Reachability* curReach = noti.object;
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    NetworkStatus reachStatus = [curReach currentReachabilityStatus];
    switch (reachStatus) {
        case NotReachable:
            _callBack(LXFNetworkStatusNotReachable);
            break;
        case ReachableViaWiFi:
            _callBack(LXFNetworkStatusWIfI);
            break;
        case ReachableViaWWAN:
            _callBack(LXFNetworkStatus4G);
            break;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end
