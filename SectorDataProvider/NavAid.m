//
//  NavAid.m
//  SectorDataProvider
//
//  Created by Wade Williams on 5/16/12.
//  Copyright (c) 2012 Wade Williams. All rights reserved.
//

#import "NavAid.h"

@implementation NavAid
@synthesize identifier;


/* Formula
 
 Given a DMS (Degrees, Minutes, Seconds) coordinate such as W87°43′41″, it's trivial to convert it to a number of decimal degrees using the following method:
 Calculate the total number of seconds:
 43′41″ = (43*60 + 41) = 2621 seconds.
 The fractional part is total number of seconds divided by 3600:
 2621 / 3600 = ~0.728056
 Add fractional degrees to whole degrees to produce the final result:
 87 + 0.728056 = 87.728056
 Since it is a West longitude coordinate, negate the result.
 The final result is -87.728056.
 */

-(double_t) dmsStringToDecimal:(NSString *)dmsString
{
	double_t degrees=0, minutes=0, seconds=0, decSeconds=0, integralPart=0;
	NSString *degreesTempString, *secondsString;
	
 	NSArray *splitString = [dmsString componentsSeparatedByString:@"."];	
	degreesTempString = [[splitString objectAtIndex:0] substringFromIndex:1];
	
	NSScanner *scan = [NSScanner scannerWithString:degreesTempString];
    int scannedInt;
    [scan scanInt:&scannedInt];
    degrees = (double_t) scannedInt;
	minutes = [[splitString objectAtIndex:1] integerValue];
	seconds = [[splitString objectAtIndex:2] integerValue];
    if ( [splitString count] > 4 )
    {
        decSeconds = [[splitString objectAtIndex:3] intValue];
        secondsString = [NSString stringWithFormat:@"%@.%@",
                                   [splitString objectAtIndex:2], [splitString objectAtIndex:3]];
        seconds = [secondsString doubleValue];
    }
	
    double_t decimalCalc = (minutes * 60 + seconds) / 3600; 
    double_t decimalPart = modf(decimalCalc, &integralPart);
    NSString *stringFinal = [NSString stringWithFormat:@"%.6f", decimalPart + degrees];
    double_t finalValue = [stringFinal doubleValue];
  
	if ( [[degreesTempString substringWithRange:NSMakeRange(0, 1)] isEqual:@"N"] || [[degreesTempString substringWithRange:NSMakeRange(0, 1)] isEqual:@"E"] )
        //W087.43.41
        return (double_t)finalValue; 	
	else
		//if it's West or South, we put a minus sign in front
        return (double_t)-finalValue; 	
	
	
	
}
@end
