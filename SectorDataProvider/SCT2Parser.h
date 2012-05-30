//
//  SCT2Parser.h
//  SectorDataProvider
//
//  Created by Wade Williams on 5/19/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCT2Parser : NSObject {
    
    @private
        NSString *filePath;
        NSDictionary *regexStrings;

}
@property (nonatomic, retain) NSArray *lines;


-(id)init;
-(id)initWithFile:(NSString *)path error:(NSError **)nError;
-(NSInteger) lineCount;
-(NSError *)readFileIntoArray;
-(NSInteger)convertSectionNameToEnum:(NSString *)sectionTitle;
-(void)parseVORSectionLine:(NSString *) line intoObjects:(NSMutableArray **)sectionObjects;
-(void)parseInfoSectionLine:(NSString *) line intoObjects:(NSMutableArray **)sectionObjects;
-(NSString *)formatSectionTitle:(NSString *)sectionTitle;
-(NSArray *) extractSectionData:(NSString *)sectionTitle;
@end

enum SECTIONS {
    INFO_ELEMENT = 0,
    VOR_ELEMENT,
    NDB_ELEMENT,
    AIRPORT_ELEMENT,
    RUNWAY_ELEMENT,
    FIXES_ELEMENT,
    ARTCC_ELEMENT,
    ARTCC_HIGH_ELEMENT,
    ARTCC_LOW_ELEMENT,
    SID_ELEMENT,
    STAR_ELEMENT,
    LOW_AIRWAY_ELEMENT,
    HIGH_AIRWAY_ELEMENT,
    GEO_ELEMENT,
    REGIONS_ELEMENT,
    LABELS_ELEMENT
};