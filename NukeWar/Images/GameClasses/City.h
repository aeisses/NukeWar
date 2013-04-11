//
//  City.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSImageLayer.h"

@interface City : NSObject
{
    int population;
    SSImageLayer *cityImage;
}

@property (assign) int population;
@property (retain, nonatomic) SSImageLayer *cityImage;
@property (readwrite) BOOL isCityDestroyed;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame;
-(void)updateCity;
-(int)returnOwnerQuadrent;
-(int)getX;
-(int)getY;

@end
