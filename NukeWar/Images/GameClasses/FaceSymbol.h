//
//  Face.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSImageLayer.h"

typedef enum {
    veryhappy,
    happy,
    neutral,
    sad,
    upset,
    angry
} FaceStates;

@interface FaceSymbol : NSObject
{
    SSImageLayer *faceImage;
    FaceStates faceStates;
}

@property (assign) FaceStates faceStates;
@property (retain, nonatomic) SSImageLayer *faceImage;

-(id)init;
-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame;
-(void)changeIncrease;
-(void)changeDecrease;
-(BOOL)isLessThan:(id)object;
-(void)setToAngry;

@end
