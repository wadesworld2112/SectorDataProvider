//
//  TestUtils.m
//  SectorDataProvider
//
//  Created by Wade Williams on 5/20/12.
//  Copyright (c) 2012 Cisco Systems. All rights reserved.
//

#import "TestUtils.h"

@implementation TestUtils

- (NSError *) createTestSectorFileWithPath:(NSString *)path content:(NSString *)content
{
    NSError *err = nil;
    
    [content writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&err];
    
    return err;
}


@end
