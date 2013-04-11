//
//  MapScreenViewItem.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-23.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSImageAnimationLayer.h"

@interface MapScreenViewItem : NSObject
{
    SSImageAnimationLayer *animationLayer;
}

@property (retain, nonatomic) SSImageAnimationLayer *animationLayer;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame;

@end
