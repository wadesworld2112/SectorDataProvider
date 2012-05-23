//
//  NavPoint.h
//  SectorDataProvider
//
//  Created by Wade Williams on 5/19/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NavPoint : NSObject
@property (nonatomic, assign) double_t lat;
@property (nonatomic, assign) double_t lon;
@property (nonatomic, retain) NSString *latString;
@property (nonatomic, retain) NSString *lonString;

-(double) dmsStringToDecimal:(NSString *)dmsString;


@end
