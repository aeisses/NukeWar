//
//  Defence.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Defence.h"

@implementation Defence

-(id)initWithName:(NSString *)name
{
    if (self = [super init]) {
        if ([name isEqualToString:@"small"]) {
            capacity = 1;
        } else if ([name isEqualToString:@"large"]) {
            capacity = 2;
        }
    }
    return self;
}

-(int)getCapacity
{
    return capacity;
}

-(BOOL)isEqual:(id)object
{
    Defence *defence = (Defence*)object;
    return capacity == defence.getCapacity;
}

-(void)dealloc
{
    [super dealloc];
}
@end
