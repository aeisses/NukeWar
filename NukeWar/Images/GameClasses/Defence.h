//
//  Defence.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//#import "Item.h"

@interface Defence : NSObject
{
    int capacity;
}

-(id)initWithName:(NSString *)name;
-(int)getCapacity;

@end
