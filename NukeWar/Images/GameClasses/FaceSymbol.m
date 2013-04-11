//
//  Face.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FaceSymbol.h"

@interface FaceSymbol (PrivateMethods)
-(void)update;
@end

@implementation FaceSymbol

@synthesize faceStates;
@synthesize faceImage;

-(id)init
{
    if (self = [super init]) {
        faceStates = veryhappy;
        faceImage = nil;
    }
    return self;
}
-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame
{
    if (self = [super init]) {
        // Set the initial city size
        faceStates = veryhappy;
        faceImage = [[SSImageLayer alloc] initWithFile:fileName andImage:image andFrame:frame];
        [self update];
    }
    return self;
}

-(void)changeDecrease
{
    switch (faceStates) {
        case veryhappy:
            faceStates = happy;
            break;
        case happy:
            faceStates = neutral;
            break;
        case neutral:
            faceStates = sad;
            break;
        case sad:
            faceStates = upset;
            break;
        case upset:
            faceStates = angry;
            break;
        case angry:
            faceStates = veryhappy;
            break;
    }
    if (faceImage != nil) {
        [self update];
    }
}

-(void)setToAngry
{
    faceStates = angry;
    if (faceImage != nil) {
        [self update];
    }
}

-(void)changeIncrease
{
    switch (faceStates) {
        case veryhappy:
            faceStates = angry;
            break;
        case happy:
            faceStates = veryhappy;
            break;
        case neutral:
            faceStates = happy;
            break;
        case sad:
            faceStates = neutral;
            break;
        case upset:
            faceStates = sad;
            break;
        case angry:
            faceStates = upset;
            break;
    }
    if (faceImage != nil) {
        [self update];
    }
}

-(void)update
{
    switch (faceStates) {
        case veryhappy:
            [faceImage setImage:@"veryHappy"];
            break;
        case happy:
            [faceImage setImage:@"happy"];
            break;
        case neutral:
            [faceImage setImage:@"neutral"];
            break;
        case sad:
            [faceImage setImage:@"sad"];
            break;
        case upset:
            [faceImage setImage:@"upSet"];
            break;
        case angry:
            [faceImage setImage:@"angry"];
            break;
    }
}

-(BOOL)isLessThan:(id)object
{
    FaceSymbol *newFace = (FaceSymbol *)object;
    return faceStates > newFace.faceStates;
}

-(void)dealloc
{
    if (faceImage != nil) {
        [faceImage release]; faceImage = nil;
    }
    [super dealloc];
}

@end
