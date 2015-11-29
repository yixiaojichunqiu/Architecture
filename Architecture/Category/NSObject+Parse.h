//
//  NSObject+Parse.h
//  Architecture
//
//  Created by tarena on 15/11/26.
//  Copyright © 2015年 weiguang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Parse)

+(id)parse:(id)responseObj;


+(NSString*)replacePropertyForKey:(NSString*)key;
+(NSDictionary*)objectClassInArray;

@end
