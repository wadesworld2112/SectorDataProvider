//
//  NavAid.m
//  SectorDataProvider
//
//  Created by Wade Williams on 5/16/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "NavAid.h"

@implementation NavAid
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
