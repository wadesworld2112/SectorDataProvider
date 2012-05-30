//
//  VOR.h
//  SectorDataProvider
//
//  Created by Wade Williams on 5/16/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "NavAid.h"

@interface VOR : NavAid
@property (nonatomic, assign) double_t frequency;
-(id)init;
-(id)initWithIdentifier:(NSString *)identifierName frequency:(double_t)freq
              latString:(NSString *)lat
              lonString:(NSString *)lon;
@end
