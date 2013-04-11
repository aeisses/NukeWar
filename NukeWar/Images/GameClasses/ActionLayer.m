//
//  ActionLayer.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-02-09.
//
//

#import "ActionLayer.h"
#import "Action.h"

@implementation ActionLayer

-(id)initWithActionType:(Action *)action
{
    if (self = [super init]) {
        self.frame = CGRectMake(0,0,0,0); // Frame for the rectangle
        
    }
    return self;
}


@end
