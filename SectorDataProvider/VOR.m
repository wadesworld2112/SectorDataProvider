//
//  VOR.m
//  SectorDataProvider
//
//  Created by Wade Williams on 5/16/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "VOR.h"

@implementation VOR
@synthesize frequency;

-(id)init
{
    return [self initWithIdentifier:nil frequency:0 latString:nil lonString:nil];
}

-(id)initWithIdentifier:(NSString *)identifierName frequency:(double_t)freq
              latString:(NSString *)lat
              lonString:(NSString *)lon
{
    if (self = [super init])
    {
        if (identifierName)
        {
            self.identifier = identifierName;
            self.frequency = freq;
            [self setLocation:[[NavPoint alloc] initWithLatString:lat lonString:lon]];
        }
        return self;
        
    }
    return nil;
}
@end

