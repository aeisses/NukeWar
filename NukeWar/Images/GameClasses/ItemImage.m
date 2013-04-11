//
//  ItemImage.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemImage.h"

@implementation ItemImage

@synthesize itemImage;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame ofType:(NSString *)type
{
    if (self = [super init]) {
        // Set the initial city size
        itemImage = [[SSImageLayer alloc] initWithFile:fileName andImage:image andFrame:frame];
        [self update:type];
    }
    return self;
}

-(void)update:(NSString *)type
{
    [itemImage setImage:type];
}

-(void)dealloc
{
    [itemImage release];
    [super dealloc];
}

@end
