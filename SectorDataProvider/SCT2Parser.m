//
//  SCT2Parser.m
//  SectorDataProvider
//
//  Created by Wade Williams on 5/19/12.
//  Copyright (c) 2012 Cisco Systems. All rights reserved.
//

#import "SCT2Parser.h"


//class extension to keep file path private
@interface SCT2Parser () {
}
    @property (nonatomic, retain) NSString *filePath;
@end

@implementation SCT2Parser
@synthesize lines;
@synthesize filePath;

-(id)init
{
    NSError *nError;
    
    return [self initWithFile:@"" error:&nError];
}


-(id)initWithFile:(NSString *)path  error:(NSError **)nError
{
    NSError *e;
    
    if (self = [super init])
    {
        if ([path length] == 0) {
            return nil;
        }
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ( NO == [fileManager fileExistsAtPath:path] )
        {
            return nil;
        }
        self.filePath = path;
        if ( (e = [self readFileIntoArray]) )
            *nError = e;
            
    }
    return self;
}

-(NSError *)readFileIntoArray
{
    NSError *fileError = nil;
    NSLog(@"attempting to read file: %@", self.filePath);
    NSString *fileLines = [NSString stringWithContentsOfFile:self.filePath encoding:NSUTF8StringEncoding error: &fileError];
    if ( fileLines )
    {
        self.lines = [fileLines componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    }
    else {
        return fileError;
    }
    return nil;
    
}

-(NSInteger) lineCount
{
    return [lines count];
}

-(NSString *)formatSectionTitle:(NSString *)sectionTitle
{
    NSError *error = nil;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[\\w+\\]"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:sectionTitle
                                                        options:0
                                                          range:NSMakeRange(0, [sectionTitle length])];
    if (numberOfMatches == 0) 
    {
        sectionTitle = [NSString stringWithFormat:@"[%@]", [sectionTitle uppercaseString]];
     }
 
    return sectionTitle;
}

-(NSInteger)convertSectionNameToEnum:(NSString *)sectionTitle
{
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[INFO]"] )
        return INFO;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[VOR]"] )
        return VOR;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[NDB]"] )
        return NDB;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[AIRPORT]"] )
        return AIRPORT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[RUNWAY]"] )
        return RUNWAY;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[FIXES]"] )
        return FIXES;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[ARTCC]"] )
        return ARTCC;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[ARTCC HIGH]"] )
        return ARTCC_HIGH;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[ARTCC LOW]"] )
        return ARTCC_LOW;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[SID]"] )
        return SID;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[STAR]"] )
        return STAR;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[LOW AIRWAY]"] )
        return LOW_AIRWAY;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[HIGH AIRWAY]"] )
        return HIGH_AIRWAY;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[GEO]"] )
        return GEO;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[REGIONS]"] )
        return REGIONS;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[LABELS]"] )
        return LABELS;
    
    return -1;
}

-(NSArray *) extractSectionData:(NSString *)sectionTitle
{
    NSError *error = nil;
    NSMutableArray *sectionLines = [[NSMutableArray alloc] init ];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[\\w+\\]"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
        
    BOOL inSection = NO;
    
        for (NSString *line in lines)
       {
            if ( NSOrderedSame == [line caseInsensitiveCompare:sectionTitle] )
           {
               inSection = YES;
           }
           
        [regex enumerateMatchesInString:line options:0 range:NSMakeRange(0, [line length]) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
            //call appropriate matcher for section type and add line to array
            switch ([self convertSectionNameToEnum:sectionTitle]) {
                case <#constant#>:
                    <#statements#>
                    break;
                    
                default:
                    break;
            };
                                              }
       }
    return nil;
}

@end
