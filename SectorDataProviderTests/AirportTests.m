//
//  NDBTests.m
//  NDBTests
//
//  Created by Wade Williams on 5/15/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "Kiwi.h"
#import "Airport.h"

SPEC_BEGIN(AirportTest)


describe(@"Airport", ^{
    __block Airport *airport = nil;
    
    beforeEach(^{ 
        airport = [[Airport alloc] initWithIdentifier:@"Test" frequency:125.0 latString:@"N042.21.26.852" lonString:@"W070.59.22.377" airspace:@"E"];
    });
    
    it(@"should be valid", ^{
        [airport shouldNotBeNil];
    });
    
    it(@"should return an identical string when identifier is set", ^{
        [airport setIdentifier:@"test"];
        [[[airport identifier] should] equal:@"test"];
    });
    
    it(@"should return an identical frequency when frequency is set", ^{
        [airport setFrequency:125.0];
        [[theValue([airport frequency]) should] equal:theValue(125.0)];
    });
    
    it(@"should return an identical lat when lat is set", ^{
        [[airport location]setLat:-90.0];
        [[theValue([[airport location ]lat]) should] equal:theValue(-90.0)];
    });
    
    it(@"should return an identical lon when lon is set", ^{
        [[airport location ]setLon:45.0];
        [[theValue([[airport location] lon]) should] equal:theValue(45.0)];
    });
    
    it(@"should return an identical string when latString is set", ^{
        [[airport location ]setLatString:@"N042.21.26.852"];
        [[[[airport location ]latString] should] equal:@"N042.21.26.852"];
    });
    
    it(@"should return an identical string when lonString is set", ^{
        [[airport location] setLonString:@"W070.59.22.377"];
        [[[[airport location] lonString] should] equal:@"W070.59.22.377"];
    });
    
    it(@"should return an identical string when airspace is set", ^{
        [airport setAirspace:@"B"];
        [[[airport airspace] should] equal:@"B"];
    });
    
    
    
    
});

SPEC_END
