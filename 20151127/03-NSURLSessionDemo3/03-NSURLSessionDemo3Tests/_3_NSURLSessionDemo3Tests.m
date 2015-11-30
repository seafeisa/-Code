//
//  _3_NSURLSessionDemo3Tests.m
//  03-NSURLSessionDemo3Tests
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface _3_NSURLSessionDemo3Tests : XCTestCase

@end

@implementation _3_NSURLSessionDemo3Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
