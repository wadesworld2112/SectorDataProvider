//
//  NavPointTests.m
//  NavPointTests
//
//  Created by Wade Williams on 5/15/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "Kiwi.h"
#import "NavPoint.h"

SPEC_BEGIN(NavPointTest)


describe(@"NavPoint", ^{
    __block NavPoint *np = nil;
    
    beforeEach(^{ 
        np = [[NavPoint alloc] init];
    });
    
    it(@"should be valid", ^{
        [np shouldNotBeNil];
    });
    
    
    it(@"should return an identical lat when lat is set", ^{
        [np setLat:-90.0];
        [[theValue([np lat]) should] equal:theValue(-90.0)];
    });
    
    it(@"should return an identical lon when lon is set", ^{
        [np setLon:45.0];
        [[theValue([np lon]) should] equal:theValue(45.0)];
    });
    
    it(@"should return an identical string when latString is set", ^{
        [np setLatString:@"N042.21.26.852"];
        [[[np latString] should] equal:@"N042.21.26.852"];
    });
    
    it(@"should return an identical string when lonString is set", ^{
        [np setLonString:@"W070.59.22.377"];
        [[[np lonString] should] equal:@"W070.59.22.377"];
    });
    
    it(@"should convert a degrees-minutes-seconds string to a decimal value", ^{
        double_t decimalValue = [np dmsStringToDecimal:@"W087.43.41"];
        [[theValue(decimalValue) should] equal:theValue(-87.728056)];
    });

    
    
});

SPEC_END
