//
//  SectorDataProviderTests.m
//  SectorDataProviderTests
//
//  Created by Wade Williams on 5/15/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "Kiwi.h"
#import "SectorDataProvider.h"

SPEC_BEGIN(SectorDataProviderTest)


describe(@"SectorDataProvider", ^{

   __block SectorDataProvider *sdp = nil;
    
    beforeEach(^{ 
        sdp = [[SectorDataProvider alloc] init];
    });
 
    it(@"should be valid", ^{
         [sdp shouldNotBeNil];
    });
    
    it(@"should return an NSArray of strings when info is called, or an empty array", ^{
        [[sdp info] shouldNotBeNil];
        if ( [[sdp info] count] > 0 )
            [[[[sdp info] objectAtIndex:0] should ] beKindOfClass:[NSString class]];
    });
    
    it(@"should return an NSDictionary when colors is called, or an empty dictionary", ^{
        [[sdp colors] shouldNotBeNil];
        [[[sdp colors] should] beKindOfClass:[NSDictionary class]];
    });
    
//        it(@"should return an NSArray of VOR objects when vors is called, or an empty array", ^{
//            [[sdp vors] shouldNotBeNil];
//        });


});

SPEC_END
