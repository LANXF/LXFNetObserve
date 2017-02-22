# LXFNetObserve
一句代码监听网络状态！简单到你想哭而且检查效率高。
目前不可判断蜂窝数据网络在3G网络还是4G网络。后续马上更新！

## 使用方法：
导入头文件：

```objc
#import "LXFNetObserverHelper.h"
```

```objc
//开始监听网络
    //开始监听网络
    [[LXFNetObserverHelper sharedInstance] startListening:^(LXFNetworkStatus status) {
    //在switch语句里面写你自己想实现的代码
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
```


## 预览图片

后续更新~。

