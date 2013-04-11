//
//  CommandCenterText.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-23.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    selecttarget,
    
} CommandStrings;

@interface CommandCenterText : NSObject

+(NSString *)getCommandString:(CommandStrings)commandString;

@end
