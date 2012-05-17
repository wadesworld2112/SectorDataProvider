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
        aid = [[NavAid alloc] init];
    });
    
    it(@"should be valid", ^{
        [aid shouldNotBeNil];
    });
    
    it(@"should return an identical string when identifier is set", ^{
        [aid setIdentifier:@"test"];
        [[[aid identifier] should] equal:@"test"];
    });

    it(@"should return an identical string when identifier is set", ^{
        [aid setIdentifier:@"test"];
        [[[aid identifier] should] equal:@"test"];
    });
    
    it(@"should convert a degrees-minutes-seconds string to a decimal value", ^{
       double_t decimalValue = [aid dmsStringToDecimal:@"W087.43.41"];
       [[theValue(decimalValue) should] equal:theValue(-87.728056)];
       });

});

SPEC_END
