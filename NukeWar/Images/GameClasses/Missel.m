//
//  Missels.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Missel.h"

@implementation Missel

-(id)initWithName:(NSString *)name
{
    if (self = [super init]) {
        if ([name isEqualToString:@"10 Mega Tons"]) {
            capacity = 10;
        } else if ([name isEqualToString:@"20 Mega Tons"]) {
            capacity = 20;
        } else if ([name isEqualToString:@"50 Mega Tons"]) {
            capacity = 50;
        } else if ([name isEqualToString:@"100 Mega Tons"]) {
            capacity = 100;
        }
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone
{
    id copy;
    if (capacity == 10) {
        copy = [[[self class] alloc] initWithName:@"10 Mega Tons"];
    } else if (capacity == 20) {
        copy = [[[self class] alloc] initWithName:@"20 Mega Tons"];
    } else if (capacity == 30) {
        copy = [[[self class] alloc] initWithName:@"50 Mega Tons"];
    } else if (capacity == 40) {
        copy = [[[self class] alloc] initWithName:@"100 Mega Tons"];
    } else {
        copy = [[[self class] alloc] initWithName:@"10 Mega Tons"];
    }
    return copy;
}

-(int)getCapacity
{
    return capacity;
}

-(BOOL)isEqual:(id)object
{
    Missel *missel = (Missel*)object;
    return capacity == missel.getCapacity;
}

-(void)dealloc
{
    [super dealloc];
}
@end
