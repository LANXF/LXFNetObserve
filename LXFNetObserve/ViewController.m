//
//  ViewController.m
//  LXFNetObserve
//
//  Created by 蓝潇枫 on 2017/2/22.
//  Copyright © 2017年 lanxiaofeng. All rights reserved.
//

#import "ViewController.h"
#import "LXFNetObserverHelper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *internetConnectionStatusField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //开始监听网络
    [[LXFNetObserverHelper sharedInstance] startListening:^(LXFNetworkStatus status) {
        switch (status) {
            case LXFNetworkStatusNotReachable:
                //            NSLog(@"不可用");
                _internetConnectionStatusField.text = @"不可以";
                break;
            case LXFNetworkStatus3G:
                //            NSLog(@"蜂窝数据");
                _internetConnectionStatusField.text = @"蜂窝数据网络";
                break;
            case LXFNetworkStatus4G:
                //            NSLog(@"蜂窝数据");
                _internetConnectionStatusField.text = @"蜂窝数据网络";
                break;
            case LXFNetworkStatusWIfI:
                //            NSLog(@"WiFi");
                _internetConnectionStatusField.text = @"WIFI";
                break;
        }
    }];
    
}


/**
 根据reachability对象来更新UI界面
 */
- (void)updateInterfaceWithRachability:(LXFNetworkStatus)networkStatus {
    switch (networkStatus) {
        case LXFNetworkStatusNotReachable:
            //            NSLog(@"不可用");
            _internetConnectionStatusField.text = @"不可以";
            break;
        case LXFNetworkStatus3G:
            //            NSLog(@"蜂窝数据");
            _internetConnectionStatusField.text = @"蜂窝数据网络";
            break;
        case LXFNetworkStatus4G:
            //            NSLog(@"蜂窝数据");
            _internetConnectionStatusField.text = @"蜂窝数据网络";
            break;
        case LXFNetworkStatusWIfI:
            //            NSLog(@"WiFi");
            _internetConnectionStatusField.text = @"WIFI";
            break;
    }
}


/**
 内存警告
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //
}


@end
