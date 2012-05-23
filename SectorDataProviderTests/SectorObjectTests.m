//
//  SectorObjectTests.m
//  SectorObjectTests
//
//  Created by Wade Williams on 5/15/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "Kiwi.h"
#import "SectorObject.h"

SPEC_BEGIN(SectorObjectTest)


describe(@"SectorObjectTests", ^{
    __block SectorObject *oot = nil;
    
    beforeEach(^{ 
        oot = [[SectorObject alloc] init];
    });
    
    it(@"should be valid", ^{
        [oot shouldNotBeNil];
    });
    
    it(@"should have a valid location", ^{
        [[oot location] shouldNotBeNil];
    });
    
    
    it(@"should return an identical string when identifier is set", ^{
        [oot setIdentifier:@"test"];
        [[[oot identifier] should] equal:@"test"];
    });
    
    
});

SPEC_END
