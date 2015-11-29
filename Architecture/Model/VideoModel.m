//
//  VideoModel.m
//  Architecture
//
//  Created by tarena on 15/11/26.
//  Copyright © 2015年 weiguang. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
+(NSDictionary *)objectClassInArray
{
    return @{@"videoList":[Videolist class],@"videoSidList":[Videosidlist class]};
}
@end

@implementation Videosidlist

@end


@implementation Videolist
+(NSString *)replacePropertyForKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        key=@"desc";
    }
    return [super replacePropertyForKey:key];
}
@end