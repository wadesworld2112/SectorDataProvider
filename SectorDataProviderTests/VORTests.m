//
//  VORdTests.m
//  VORTests
//
//  Created by Wade Williams on 5/15/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "Kiwi.h"
#import "VOR.h"

SPEC_BEGIN(VORTest)


describe(@"VOR", ^{
    __block VOR *vor = nil;
    
    beforeEach(^{ 
        vor = [[VOR alloc] init];
    });
    
    it(@"should be valid", ^{
        [vor shouldNotBeNil];
    });
    
    it(@"should return an identical string when identifier is set", ^{
        [vor setIdentifier:@"test"];
        [[[vor identifier] should] equal:@"test"];
    });
    
    it(@"should return an identical frequency when frequency is set", ^{
        [vor setFrequency:125.0];
        [[theValue([vor frequency]) should] equal:theValue(125.0)];
    });

    it(@"should return an identical lat when lat is set", ^{
        [vor setLat:-90.0];
        [[theValue([vor lat]) should] equal:theValue(-90.0)];
    });
    
    it(@"should return an identical lon when lon is set", ^{
        [vor setLon:45.0];
        [[theValue([vor lon]) should] equal:theValue(45.0)];
    });

    it(@"should return an identical string when latString is set", ^{
        [vor setLatString:@"N042.21.26.852"];
        [[[vor latString] should] equal:@"N042.21.26.852"];
    });
    
    it(@"should return an identical string when lonString is set", ^{
        [vor setLonString:@"W070.59.22.377"];
        [[[vor lonString] should] equal:@"W070.59.22.377"];
    });
    



});

SPEC_END
