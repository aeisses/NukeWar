//
//  ItemImage.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSImageLayer.h"

@interface ItemImage : NSObject
{
    SSImageLayer *itemImage;
}

@property (retain, nonatomic) SSImageLayer *itemImage;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame ofType:(NSString *)type;
-(void)update:(NSString *)type;

@end
