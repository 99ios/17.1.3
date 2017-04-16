//
//  ViewController.m
//  17.1.3 接近传感器proximityState
//
//  Created by 李维佳 on 2017/4/12.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIDevice *device = [UIDevice currentDevice];
    //开启接近传感器
    device.proximityMonitoringEnabled = YES;
    //接近传感器通知
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(proximityStateChange) name:UIDeviceProximityStateDidChangeNotification object:nil];
}

-(void) proximityStateChange {
    UIDevice *device = [UIDevice currentDevice];
    if (device.proximityState == YES) {
        NSLog(@"物体靠近");
    }else {
        NSLog(@"物体离开");
    }
}

-(void)dealloc {
    //移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
