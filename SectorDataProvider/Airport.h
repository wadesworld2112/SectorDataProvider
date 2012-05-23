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

@end
