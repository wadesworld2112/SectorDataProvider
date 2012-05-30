//
//  NDBTests.m
//  NDBTests
//
//  Created by Wade Williams on 5/15/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "Kiwi.h"
#import "NDB.h"

SPEC_BEGIN(NDBTest)


describe(@"NDB", ^{
    __block NDB *ndb = nil;
    
    beforeEach(^{ 
        ndb = [[NDB alloc] initWithIdentifier:@"Test" latString:@"N042.21.19.173" lonString:@"W071.00.35.002"];
    });
    
    it(@"should be valid", ^{
        [ndb shouldNotBeNil];
    });
    
    it(@"should return an identical string when identifier is set", ^{
        [ndb setIdentifier:@"test"];
        [[[ndb identifier] should] equal:@"test"];
    });
    
    it(@"should return an identical frequency when frequency is set", ^{
        [ndb setFrequency:125.0];
        [[theValue([ndb frequency]) should] equal:theValue(125.0)];
    });
    
    it(@"should return an identical lat when lat is set", ^{
        [[ndb location]setLat:-90.0];
        [[theValue([[ndb location ]lat]) should] equal:theValue(-90.0)];
    });
    
    it(@"should return an identical lon when lon is set", ^{
        [[ndb location ]setLon:45.0];
        [[theValue([[ndb location] lon]) should] equal:theValue(45.0)];
    });
    
    it(@"should return an identical string when latString is set", ^{
        [[ndb location ]setLatString:@"N042.21.26.852"];
        [[[[ndb location ]latString] should] equal:@"N042.21.26.852"];
    });
    
    it(@"should return an identical string when lonString is set", ^{
        [[ndb location] setLonString:@"W070.59.22.377"];
        [[[[ndb location] lonString] should] equal:@"W070.59.22.377"];
    });
    
    
    
    
});

SPEC_END
