//
//  NavAid.h
//  SectorDataProvider
//
//  Created by Wade Williams on 5/16/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavPoint.h"

@interface NavAid : NSObject
@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NavPoint *location;
-(id)init;
@end
