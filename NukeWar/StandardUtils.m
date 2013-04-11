//
//  StandardUtils.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-04-01.
//
//

#import "StandardUtils.h"

@implementation StandardUtils

+(int)getRandomNumber:(int)mod
{
    return (int)(arc4random()%mod);
}

@end
