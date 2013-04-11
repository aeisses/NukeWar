//
//  CityLabel.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-03.
//
//

#import "CityLabel.h"

@implementation CityLabel

-(void)setText:(NSString *)text
{
    if ([text isEqualToString:@"0"]) {
        self.hidden = YES;
    }
    [super setText:text];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
