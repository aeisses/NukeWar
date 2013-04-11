//
//  ActionLayer.h
//  NukeWar
//
//  Created by Aaron Eisses on 13-02-09.
//
//

#import <QuartzCore/QuartzCore.h>
#import "Action.h"

@interface ActionLayer : CALayer
{
    
}

-(id)initWithActionType:(Action *)action;

@end
