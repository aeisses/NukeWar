//
//  SSImageLayer.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface SSImageLayer : CALayer
{
    float imageWidth;
    float imageHeight;
    NSDictionary *myPlist;
}

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame;
-(void)setImage:(NSString *)imageName;

@end
