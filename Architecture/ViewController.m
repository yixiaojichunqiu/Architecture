//
//  ViewController.m
//  Architecture
//
//  Created by tarena on 15/11/26.
//  Copyright © 2015年 weiguang. All rights reserved.
//

#import "ViewController.h"
#import "VideoNetManager.h"
@interface ViewController ()
@property (nonatomic,strong) VideoModel * videoModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [VideoNetManager getVideoCompletionHandle:^(VideoModel *model, NSError *error) {
        self.videoModel=model;
        NSLog(@"断点");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
