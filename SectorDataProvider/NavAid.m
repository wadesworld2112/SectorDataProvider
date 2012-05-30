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


-(id)initWithIdentifier:(NSString *)identifierName
              latString:(NSString *)lat
              lonString:(NSString *)lon
{
    if (self = [super init])
    {
        if (identifierName)
        {
            self.identifier = identifierName;
            [self setLocation:[[NavPoint alloc] initWithLatString:lat lonString:lon]];
        }
        return self;
        
    }
    return nil;
}

-(id)init
{
    return [self initWithIdentifier:nil latString:nil lonString:nil];
}


@end
