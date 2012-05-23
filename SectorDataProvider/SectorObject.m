//
//  SectorObject.m
//  SectorDataProvider
//
//  Created by Wade Williams on 5/19/12.
//  Copyright (c) 2012 Cisco Systems. All rights reserved.
//

#import "SectorObject.h"

@implementation SectorObject
@synthesize identifier;
@synthesize location;

-(id)init
{
    if (self = [super init])
    {
        [self setLocation:[[NavPoint alloc] init]];
    }
    return self;
}

@end
