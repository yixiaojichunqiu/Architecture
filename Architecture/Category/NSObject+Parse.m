//
//  NSObject+Parse.m
//  Architecture
//
//  Created by tarena on 15/11/26.
//  Copyright © 2015年 weiguang. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)
//防止向不存在的key赋值导致崩溃
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
//防止key中赋值nil导致崩溃
-(void)setNilValueForKey:(NSString *)key{}

+(id)parse:(id)responseObj
{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self parseArr:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self parseDic:responseObj];
    }
    return responseObj;
}

+(id)parseArr:(NSArray*)arr{
    NSMutableArray* array=[NSMutableArray new];
    for (id obj in arr) {
        [array addObject:[self parse:obj]];
    }
    return [array copy];
}

+(id)parseDic:(NSDictionary*)dic{
    //目的是解析成自己的模型对象，字典里的属性是数组，字典转成对象，属性还是数组，数组里如果是(字典)，也把(字典)变成其他模型类对象
    //哪个模型类进来了
    id anObj=[self new];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        key=[self replacePropertyForKey:key];
        if ([obj isKindOfClass:[NSArray class]]) {
            Class class=[self objectClassInArray][key];
            if (class) {
                NSMutableArray* array=[NSMutableArray new];
                for (id object in obj) {
                    [array addObject:[class parse:object]];
                }
                obj=[array copy];
            }
        }
        [anObj setValue:obj forKey:key];
    }];
    return anObj;
}

//子类可能需要重写的方法
+(NSString *)replacePropertyForKey:(NSString *)key
{
    return key;
}

+(NSDictionary *)objectClassInArray
{
    return nil;
}

@end
