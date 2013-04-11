//
//  pushNotification.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-20.
//
//

#import "pushNotification.h"
#import "Colours.h"

@implementation pushNotification

@synthesize mainLabel;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        mainLabel.textColor = [Colours getTextColourWithAlpha:1.0];
        self.backgroundColor = [Colours getCharacterBackgroundColor:1.0];
    }
    return self;
}

-(void)setText:(NSString *)string2Set
{
    mainLabel.text = string2Set;
}

-(void)dealloc
{
    [mainLabel release]; mainLabel = nil;
    [super dealloc];
}

@end
