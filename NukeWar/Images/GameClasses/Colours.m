//
//  Colours.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-05.
//
//

#import "Colours.h"

@implementation Colours

+(float)hexToDec:(int)input
{
    return (float)input/255;
}

+(UIColor*)getTextColourWithAlpha:(float)alpha
{
    return [UIColor colorWithRed:[self hexToDec:236] green:[self hexToDec:207] blue:[self hexToDec:141] alpha:alpha];
}

+(UIColor*)getBackGroundColourWithAlpha:(float)alpha
{
    return [UIColor colorWithRed:[self hexToDec:93] green:[self hexToDec:129] blue:[self hexToDec:155] alpha:alpha];
}

+(UIColor*)getButtonColourWithAlpha:(float)alpha
{
    return [UIColor colorWithRed:[self hexToDec:94] green:[self hexToDec:105] blue:[self hexToDec:45] alpha:alpha];
}

+(UIColor*)getShadowColourWithAlpha:(float)alpha
{
    return [UIColor colorWithRed:[self hexToDec:28] green:[self hexToDec:27] blue:[self hexToDec:22] alpha:alpha];
}

+(UIColor*)getCharacterBackgroundColor:(float)alpha
{
    return [UIColor colorWithRed:[self hexToDec:158] green:[self hexToDec:59] blue:[self hexToDec:51] alpha:alpha];
}

@end
