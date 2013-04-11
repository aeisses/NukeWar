//
//  Item.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSImageAnimationLayer.h"

@interface Item : NSObject
{
    NSString *name;
    SSImageAnimationLayer *animationLayer;
}

@property (assign) NSString *name;
@property (retain, nonatomic) SSImageAnimationLayer *animationLayer;

-(id)initWithName:(NSString *)_name;

@end

