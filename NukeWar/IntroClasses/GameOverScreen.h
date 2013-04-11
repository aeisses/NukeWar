//
//  GameOverScreen.h
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-03.
//
//

#import <UIKit/UIKit.h>

@protocol GameOverScreenDelegate <NSObject>
-(void)playAgain;
@end

@interface GameOverScreen : UIView
{
    IBOutlet UIButton *playAgainButton;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *resultLabel;
    id <GameOverScreenDelegate> delegate;
}

@property (retain, nonatomic) IBOutlet UIButton *playAgainButton;
@property (retain, nonatomic) IBOutlet UILabel *scoreLabel;
@property (retain, nonatomic) IBOutlet UILabel *resultLabel;
@property (retain, nonatomic) id <GameOverScreenDelegate> delegate;

-(void)setResult:(NSString *)player withScore:(int)score;
-(IBAction)touchPlayAgainButton:(id)sender;

@end
