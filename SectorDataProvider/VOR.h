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
@property (nonatomic, assign) double_t lat;
@property (nonatomic, assign) double_t lon;
@property (nonatomic, retain) NSString *latString;
@property (nonatomic, retain) NSString *lonString;
@end
