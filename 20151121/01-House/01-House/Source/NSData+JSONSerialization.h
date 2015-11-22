//
//  NSData+JSONSerialization.h
//  01-House
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSData (JSONSerialization)
-(id)jsonSererror:(NSError *)error;
-(UIImage*)imageFromdata;
@end
