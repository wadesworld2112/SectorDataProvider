//
//  SectorDataProvider.m
//  SectorDataProvider
//
//  Created by Wade Williams on 5/15/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "SectorDataProvider.h"
#import "VOR.h"

@implementation SectorDataProvider

- (NSArray *) info
{
    return [NSArray arrayWithObjects:@"blah", nil];
}

- (NSDictionary *)colors
{
    return [NSDictionary dictionaryWithObjectsAndKeys:@"value", @"key", nil];
}

- (NSArray *)vors
{
    //return [VOR vorFromString];
    return nil;
}

@end
