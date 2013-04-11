//
//  WarHead.h
//  NukeWar
//
//  Created by Aaron Eisses on 13-02-22.
//
//

#import <Foundation/Foundation.h>

@interface WarHead : NSObject <NSCopying>
{
    int capacity;
}

-(id)initWithName:(NSString *)name;
-(int)getCapacity;

@end
