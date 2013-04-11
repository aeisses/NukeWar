//
//  citySelect.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSImageAnimationLayer.h"

#define animationFrame 8

@interface citySelect : NSObject
{
    SSImageAnimationLayer *target;
}

@property (retain, nonatomic) SSImageAnimationLayer *target;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame;
-(void)showAnimationAtFrame:(CGRect)frame;
-(void)removeAnimation;

@end
