//
//  SCTrTests.m
//  SectorDataProviderTests
//
//  Created by Wade Williams on 5/15/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "Kiwi.h"
#import "SCT2Parser.h"
#import "TestUtils.h"



SPEC_BEGIN(SCT2ParserTests)



describe(@"SCT2Parser", ^{
    
    __block SCT2Parser *parser = nil;
    __block NSError *error = nil;
    __block NSString *testResourcePath = nil;
    __block NSArray *sectionTitles = [NSArray arrayWithObjects:@"[INFO]", @"[AIRPORT]", @"[RUNWAY]", @"[FIXES]",
                               @"[ARTCC]", @"[ARTCC HIGH]", @"[ARTCC LOW]", @"[SID]", @"[STAR]",
                               @"[LOW AIRWAY]", @"[HIGH AIRWAY]", @"[GEO]", @"[REGIONS]", @"[LABELS]", nil];
    
    beforeEach(^{ 
        
        testResourcePath = [NSString stringWithFormat:@"%@%@",[[NSFileManager defaultManager]currentDirectoryPath],
                            @"/Resources/"];
        parser = [[SCT2Parser alloc] initWithFile:[testResourcePath stringByAppendingString:@"zla19.sct"] error:&error];
    });
    
    it(@"should be valid", ^{
        [parser shouldNotBeNil];
    });
    
    it(@"should return nil if given invalid file", ^{
        SCT2Parser *invalid_parser;
        invalid_parser = [[SCT2Parser alloc] initWithFile:@"invalid_path" error:&error];
       [invalid_parser shouldBeNil];
    });
    
    
    it(@"should return a positive line count when given a valid file", ^{
        [[theValue([parser lineCount]) should] beGreaterThan:theValue(0)];
    });
   
    it(@"should read the lines of the file into an NSArray", ^{
        [[[parser lines] should ] beKindOfClass:[NSArray class]];
    });
    
    it(@"should format a section title with missing brackets", ^{
        NSString *title = [parser formatSectionTitle:@"info"];
        [[title should] equal:@"[INFO]"];
    });
    
    it(@"should not modify a correctly formated section title", ^{
        NSString *title = [parser formatSectionTitle:@"[INFO]"];
        [[title should] equal:@"[INFO]"];
    });
    
    it(@"should return the correct enum for a section title", ^{
        
        //TODO: generate a random number
        NSInteger whichTitle = 4;
        
        NSString *title = [sectionTitles objectAtIndex:whichTitle];
        [[theValue([parser convertSectionNameToEnum:title]) should] equal:theValue(whichTitle)];
    });


    
//    it(@"should read a sector file section", ^{
//        TestUtils *t = nil;
//        NSString *testSectorData = [NSString stringWithString:@"[Info]\Desired Sector Data\n[VOR]\nWrong Sector Data\n[NDB]\nWrong Sector Data\n"];
//        
//        [t createTestSectorFileWithPath:[testResourcePath stringByAppendingString:@"test_sector.sct"] content:testSectorData];
//        
//        NSArray *sectionData = [parser extractSectionData:@"Info"];
//        
//        
//    });
// 
    
});

SPEC_END
