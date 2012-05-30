//
//  NavAidTests.m
//  NavAidTests
//
//  Created by Wade Williams on 5/15/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "Kiwi.h"
#import "NavAid.h"

SPEC_BEGIN(NavAidTest)


describe(@"NavAid", ^{
    __block NavAid *aid = nil;
    
    beforeEach(^{ 
        aid = [[NavAid alloc] initWithIdentifier:@"Test" latString:@"N042.21.19.173" lonString:@"W071.00.35.002"];
    });
    
    it(@"should be valid", ^{
        [aid shouldNotBeNil];
    });
    
    it(@"should have a valid location", ^{
        [[aid location] shouldNotBeNil];
    });
    
    
    it(@"should return an identical string when identifier is set", ^{
        [aid setIdentifier:@"test"];
        [[[aid identifier] should] equal:@"test"];
    });

 
});

SPEC_END
