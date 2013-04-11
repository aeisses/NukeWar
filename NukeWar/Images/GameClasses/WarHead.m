//
//  WarHead.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-02-22.
//
//

#import "WarHead.h"

@implementation WarHead

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
    WarHead *warHead = (WarHead*)object;
    return capacity == warHead.getCapacity;
}

-(void)dealloc
{
    [super dealloc];
}

@end
