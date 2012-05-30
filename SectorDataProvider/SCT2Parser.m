//
//  SCT2Parser.m
//  SectorDataProvider
//
//  Created by Wade Williams on 5/19/12.
//  Copyright (c) 2012 Cisco Systems. All rights reserved.
//

#import "SCT2Parser.h"
#import "VOR.h"


//class extension to keep file path private
@interface SCT2Parser () {
}
    @property (nonatomic, retain) NSString *filePath;
    @property (nonatomic, retain) NSDictionary *regexStrings;
@end

@implementation SCT2Parser
@synthesize lines;
@synthesize filePath;
@synthesize regexStrings;

                              
                              
                              
                              

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
        
         regexStrings = [NSDictionary  dictionaryWithObjectsAndKeys:
                         @".*", [NSNumber numberWithInt:INFO_ELEMENT],
                                      @"(\\w+)\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,}\\.\\d{1,})", [NSNumber numberWithInt:VOR_ELEMENT],
                                      @"(\\w+)\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})", [NSNumber numberWithInt:NDB_ELEMENT],
                                      @"(\\w+)\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([A-Ea-e])", [NSNumber numberWithInt:AIRPORT_ELEMENT],
                                      @"(\\d+{1,}[\\w])\\s+(\\d+{1,}[\\w])\\s+(\\d+{3})\\s+(\\d+{3})\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})", [NSNumber numberWithInt:RUNWAY_ELEMENT],
                                      @"(\\w+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})", [NSNumber numberWithInt:FIXES_ELEMENT],
                                      @"(\\w+)\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})", [NSNumber numberWithInt:ARTCC_ELEMENT],
                                      @"(\\w+)\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})", [NSNumber numberWithInt:ARTCC_HIGH_ELEMENT],                              
                                      @"(\\w+)\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})", [NSNumber numberWithInt:ARTCC_LOW_ELEMENT],
                                      @"([\\w\\s]+)\\s*(\\w+|)\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s*(\\w+|\\d+)*", [NSNumber numberWithInt:SID_ELEMENT],
                                      @"([\\w\\s]+)\\s*(\\w+|)\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s*(\\w+|\\d+)*", [NSNumber numberWithInt:STAR_ELEMENT],
                                      @"([\\w\\d\\-]+)\\s*(\\w+|)\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s*(\\w+|\\d+)*", [NSNumber numberWithInt:LOW_AIRWAY_ELEMENT],
                                      @"([\\w\\d\\-]+)\\s*(\\w+|)\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\w+|[NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s*(\\w+|\\d+)*", [NSNumber numberWithInt:HIGH_AIRWAY_ELEMENT],
                                      @"(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})", [NSNumber numberWithInt:GEO_ELEMENT],
                                      @"(\\w+|\\s+)\\s*(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})", [NSNumber numberWithInt:REGIONS_ELEMENT],
                                      @"\\\".*\\\"(\\d{3}\\.\\d+)\\s+([NnSs]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([WwEe]\\d{1,}\\.\\d{1,}\\.\\d{1,})\\s+([\\w\\d]+)", [NSNumber numberWithInt:LABELS_ELEMENT], nil];
        

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
        return INFO_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[VOR]"] )
        return VOR_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[NDB]"] )
        return NDB_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[AIRPORT]"] )
        return AIRPORT_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[RUNWAY]"] )
        return RUNWAY_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[FIXES]"] )
        return FIXES_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[ARTCC]"] )
        return ARTCC_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[ARTCC HIGH]"] )
        return ARTCC_HIGH_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[ARTCC LOW]"] )
        return ARTCC_LOW_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[SID]"] )
        return SID_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[STAR]"] )
        return STAR_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[LOW AIRWAY]"] )
        return LOW_AIRWAY_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[HIGH AIRWAY]"] )
        return HIGH_AIRWAY_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[GEO]"] )
        return GEO_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[REGIONS]"] )
        return REGIONS_ELEMENT;
    if ( NSOrderedSame == [sectionTitle caseInsensitiveCompare:@"[LABELS]"] )
        return LABELS_ELEMENT;
    
    return -1;
}

-(void)parseInfoSectionLine:(NSString *) line intoObjects:(NSMutableArray **)sectionObjects
{
    
}


-(void)parseVORSectionLine:(NSString *) line intoObjects:(NSMutableArray **)sectionObjects
{
    NSError *error = nil;
    
    NSRegularExpression *regex = [NSRegularExpression 
                                  regularExpressionWithPattern:[regexStrings objectForKey:[NSNumber numberWithInt:VOR_ELEMENT]]
                                  options:NSRegularExpressionCaseInsensitive
                                  error:&error];

 
    NSArray *matches = [regex matchesInString:line options:0 range:NSMakeRange(0, [line length])];
    if ( [matches count] > 0 )
    {
        NSTextCheckingResult *r = [matches objectAtIndex:0];
        
        if ( [r numberOfRanges] == 5 )
        {
            VOR *v = [[VOR alloc] initWithIdentifier:
                      [line substringWithRange:[r rangeAtIndex:1]] 
                    frequency:[[line substringWithRange:[r rangeAtIndex:2]] doubleValue]
                    latString:[line substringWithRange:[r rangeAtIndex:3]]
                    lonString:[line substringWithRange:[r rangeAtIndex:4]]];
            [*sectionObjects addObject:v];
        }
    }

}
                                  
-(NSArray *) extractSectionData:(NSString *)sectionTitle
{
    NSMutableArray *sectionObjects = [[NSMutableArray alloc] init ];
    
          
    BOOL inSection = NO;
    
        for (NSString *line in lines)
       {
            if ( NSOrderedSame == [line caseInsensitiveCompare:sectionTitle] )
           {
               inSection = YES;
           }
           
             //call appropriate parser for each section type.  The parser
             //will parse the line into the appropriate object type
             //and add it to the array
            switch ([self convertSectionNameToEnum:sectionTitle]) {
                case INFO_ELEMENT:
                    [self parseInfoSectionLine:line intoObjects:&sectionObjects];
                    break;                    
                case VOR_ELEMENT:
                    [self parseVORSectionLine:line intoObjects:&sectionObjects];
                    break;
                default:
                    break;
            };
                                    
       }
    return nil;
}

@end
