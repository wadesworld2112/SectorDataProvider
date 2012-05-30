//
//  Airport.m
//  SectorDataProvider
//
//  Created by Wade Williams on 5/19/12.
//  Copyright (c) 2012 Cisco Systems. All rights reserved.
//

#import "Airport.h"

@implementation Airport
@synthesize airspace;
@synthesize frequency;

-(id)init
{
    return [self initWithIdentifier:nil frequency:0 latString:nil lonString:nil airspace:nil];
}

-(id)initWithIdentifier:(NSString *)identifierName frequency:(double_t)freq
              latString:(NSString *)lat
              lonString:(NSString *)lon
              airspace:(NSString *)airport_airspace
{
    if (self = [super init])
    {
        if (self.identifier)
        {
            self.identifier = identifierName;
            self.frequency = freq;
            [self setLocation:[[NavPoint alloc] initWithLatString:lat lonString:lon]];
            self.airspace = airport_airspace;
        }
        return self;
        
    }
    return nil;
}

@end
