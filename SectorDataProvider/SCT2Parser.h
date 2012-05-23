//
//  SCT2Parser.h
//  SectorDataProvider
//
//  Created by Wade Williams on 5/19/12.
//  Copyright (c) 2012 Cisco Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCT2Parser : NSObject {
    
    @private
        NSString *filePath;

}
@property (nonatomic, retain) NSArray *lines;


-(id)init;
-(id)initWithFile:(NSString *)path error:(NSError **)nError;
-(NSInteger) lineCount;
-(NSError *)readFileIntoArray;
-(NSInteger)convertSectionNameToEnum:(NSString *)sectionTitle;
-(NSString *)formatSectionTitle:(NSString *)sectionTitle;
-(NSArray *) extractSectionData:(NSString *)sectionTitle;
@end

enum SECTIONS {
    COLORS = 0,
    INFO,
    VOR,
    NDB,
    AIRPORT,
    RUNWAY,
    FIXES,
    ARTCC,
    ARTCC_HIGH,
    ARTCC_LOW,
    SID,
    STAR,
    LOW_AIRWAY,
    HIGH_AIRWAY,
    GEO,
    REGIONS,
    LABELS
};