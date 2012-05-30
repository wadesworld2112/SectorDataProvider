//
//  Airport.h
//  SectorDataProvider
//
//  Created by Wade Williams on 5/19/12.
//  Copyright (c) 2012 Cisco Systems. All rights reserved.
//

#import "SectorObject.h"

@interface Airport : SectorObject
@property (nonatomic, retain) NSString *airspace;
@property (nonatomic, assign) double_t frequency;
-(id)init;
-(id)initWithIdentifier:(NSString *)identifierName frequency:(double_t)freq
              latString:(NSString *)lat
              lonString:(NSString *)lon
               airspace:(NSString *)airport_airspace;

@end
