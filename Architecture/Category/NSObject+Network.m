//
//  NSObject+Network.m
//  Architecture
//
//  Created by tarena on 15/11/26.
//  Copyright © 2015年 weiguang. All rights reserved.
//

#import "NSObject+Network.h"

@implementation NSObject (Network)

+(id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandle:(void(^)(id,NSError*))completionHandle
{
    NSMutableURLRequest* request=[NSMutableURLRequest requestWithURL:[self urlWithPath:path parameters:parameters] cachePolicy:0 timeoutInterval:30];
    request.HTTPMethod=@"get";
    
    NSURLSessionTask* task=[[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            
        }
        else
        {
#warning 这写的不全 什么下载回来 返回主线程 补全前边什么的
            NSError* err=nil;
            id obj=[NSJSONSerialization JSONObjectWithData:data options:    NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments error:&err];
            if (err) {
                completionHandle(nil,err);
            }
            else
            {
                completionHandle(obj,nil);
            }
        }
    }];
    [task resume];
    return task;
}



+(NSURL *)urlWithPath:(NSString *)path parameters:(NSDictionary *)parameters
{
    NSMutableString* urlPath=[[NSMutableString alloc]initWithString:path];
    //判断参数是否为空 并 含有值
    if (parameters != nil && parameters.allKeys.count != 0) {
        //为了提高for循环效率 把allkeys拿到外边
        NSArray* allkeys=parameters.allKeys;
        NSInteger count=allkeys.count;
        for (int i=0; i<count; i++) {
            NSString* key=allkeys[i];
            if (i==0) {
                [urlPath appendFormat:@"?%@=%@",key,parameters[key]];
            }
            else
            {
                [urlPath appendFormat:@"&%@=%@",key,parameters[key]];
            }
        }
    }
    return [NSURL URLWithString:urlPath];
}
@end

