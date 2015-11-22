//
//  NSData+JSONSerialization.m
//  01-House
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "NSData+JSONSerialization.h"


@implementation NSData (JSONSerialization)

//-(id)jsonSerWithData:(NSData *)data error:(NSError *)error{
-(id)jsonSererror:(NSError *)error{
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:&error];
}
-(UIImage *)imageFromdata{
    return [UIImage imageWithData:self];
}
@end
