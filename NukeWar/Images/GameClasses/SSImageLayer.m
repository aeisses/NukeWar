//
//  SSImageLayer.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SSImageLayer.h"
#import "StringUtils.h"

@interface SSImageLayer (PrivateMethods)

@end

@implementation SSImageLayer

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame
{
    if (self = [super init]) {
        self.frame = frame;
        self.contents = (id)image.CGImage;
        imageWidth = CGImageGetWidth(image.CGImage);
        imageHeight = CGImageGetHeight(image.CGImage);
        
        NSDictionary *plistData;   
        NSString *localizedPath = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]];
        plistData = [[NSDictionary alloc] initWithContentsOfFile:localizedPath];
        [localizedPath release];
        myPlist = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)[plistData objectForKey:@"frames"]];
        [plistData release]; 
    }
    return self;
}

-(void)setImage:(NSString *)imageName
{
    NSString *dictKey = [[NSString alloc] initWithFormat:@"%@.png",imageName];
    NSDictionary *tempDictionary = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)[myPlist objectForKey:dictKey]];
    CGRect locationFrame = [(NSString *)[tempDictionary objectForKey:@"frame"] stringToRect];
    [tempDictionary release];
    CGSize normalizedSize = CGSizeMake( locationFrame.size.width/imageWidth, locationFrame.size.height/imageHeight ); 
    self.contentsRect = CGRectMake(locationFrame.origin.x/imageWidth,
                                   locationFrame.origin.y/imageHeight,
                                   normalizedSize.width, normalizedSize.height);
    [dictKey release];
}

// De-activate the built in animation
+(id < CAAction >)defaultActionForKey:(NSString *)aKey;
{
    if ([aKey isEqualToString:@"contentsRect"])
        return (id < CAAction >)[NSNull null];
    
    return [super defaultActionForKey:aKey];
}

@end
