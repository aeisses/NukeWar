//
//  TextTile.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-06.
//
//

#import "LabelTile.h"

@implementation LabelTile

- (id)initWithFrame:(CGRect)frame andText:(NSString *)text andName:(NSString*)name andBGColour:(UIColor *)bgColour andSelectColour:(UIColor *)selectColour andTextColour:(UIColor *)textColour andTextFrame:(CGRect)textFrame
{
    self = [super initWithFrame:frame andName:name andBGColour:bgColour andSelectColour:selectColour];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:textFrame];
        self.label.text = [NSString stringWithString:text];
        self.label.textColor = textColour;
        self.label.numberOfLines = 3;
        self.label.backgroundColor = [UIColor clearColor];
        [self addSubview:_label];
    }
    return self;
}

-(void)dealloc
{
    [self.label release];
    [super dealloc];
}

@end
