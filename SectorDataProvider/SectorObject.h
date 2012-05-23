//
//  SectorObject.h
//  SectorDataProvider
//
//  Created by Wade Williams on 5/19/12.
//  Copyright (c) 2012 Cisco Systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavPoint.h"

@interface SectorObject : NSObject
@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NavPoint *location;
-(id)init;

@end
