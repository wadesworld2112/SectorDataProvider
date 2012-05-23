//
//  TestUtils.h
//  SectorDataProvider
//
//  Created by Wade Williams on 5/20/12.
//  Copyright (c) 2012 Cisco Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestUtils : NSObject

- (NSError *) createTestSectorFileWithPath:(NSString *)path content:(NSString *)content;

@end
