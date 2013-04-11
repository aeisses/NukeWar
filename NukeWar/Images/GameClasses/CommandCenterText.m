//
//  CommandCenterText.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-23.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CommandCenterText.h"

@implementation CommandCenterText

+(NSString *)getCommandString:(CommandStrings)commandString
{
    switch (commandString) {
        case selecttarget:
            return @"Please select a target!";
            break;
    }
    return nil;
}

@end
