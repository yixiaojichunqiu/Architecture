//
//  NSObject+Network.h
//  Architecture
//
//  Created by tarena on 15/11/26.
//  Copyright © 2015年 weiguang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Network)

+(id)GET:(NSString*)path parameters:(NSDictionary*)parameters completionHandle:(void(^)(id response,NSError* error))completionHandle;
+(id)POST:(NSString*)path parameters:(NSDictionary*)parameters completionHandle:(void(^)(id response,NSError* error))completionHandle;

+(NSURL *)urlWithPath:(NSString *)path parameters:(NSDictionary *)parameters;
@end
