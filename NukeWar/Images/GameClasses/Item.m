//
//  Item.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize name;
@synthesize animationLayer;

-(id)initWithName:(NSString *)_name
{
    if (self = [super init]) {
        name = [[NSString alloc] initWithString:_name];
    }
    return self;
}

-(void)dealloc
{
    [name release];
    [super dealloc];
}

@end
