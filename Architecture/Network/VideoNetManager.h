//
//  VideoNetManager.h
//  Architecture
//
//  Created by tarena on 15/11/26.
//  Copyright © 2015年 weiguang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Network.h"
#import "VideoModel.h"
@interface VideoNetManager : NSObject

+(void)getVideoCompletionHandle:(void(^)(VideoModel* model,NSError* error))completionHandle;

@end
