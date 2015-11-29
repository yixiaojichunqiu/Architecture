//
//  VideoModel.h
//  Architecture
//
//  Created by tarena on 15/11/26.
//  Copyright © 2015年 weiguang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Parse.h"

@class Videosidlist,Videolist;
@interface VideoModel : NSObject

@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray<Videosidlist *> *videoSidList;

@property (nonatomic, strong) NSArray<Videolist *> *videoList;

@end

@interface Videosidlist : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;

@end

@interface Videolist : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *m3u8Hd_url;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *mp4Hd_url;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *m3u8_url;

@end

