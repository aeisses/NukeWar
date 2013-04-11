//
//  Light.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSImageLayer.h"

@interface Light : NSObject
{
    SSImageLayer *lightImage;
    BOOL selected;
}

@property (assign) BOOL selected;
@property (retain, nonatomic) SSImageLayer *lightImage;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame;
-(void)update;

@end