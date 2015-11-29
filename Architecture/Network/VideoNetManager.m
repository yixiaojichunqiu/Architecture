//
//  VideoNetManager.m
//  Architecture
//
//  Created by tarena on 15/11/26.
//  Copyright © 2015年 weiguang. All rights reserved.
//

#import "VideoNetManager.h"

@implementation VideoNetManager

+(void)getVideoCompletionHandle:(void(^)(VideoModel *, NSError *))completionHandle
{
    [self GET:@"http://c.m.163.com/nc/video/home/1-10.html" parameters:nil completionHandle:^(id response, NSError *error) {
        completionHandle([VideoModel parse:response],error);
    }];
}

@end
