//
//  SoundUtils.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-30.
//
//

#import "SoundUtils.h"

#define exposionSound @"explosion"
#define buildSound @"jackhammer"

@implementation SoundUtils

+(void)playExplosionSound
{
    if (1/*isSoundOn*/) {
        NSString *fileName = [[NSString alloc] initWithString:exposionSound];
        NSString *audioFile = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"]];
        [fileName release];
        NSURL *soundBetBtnClickUrl = [[NSURL alloc] initFileURLWithPath:audioFile];
        [audioFile release];
        NSError *error;
        AVAudioPlayer *myBetBtnClickPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundBetBtnClickUrl error:&error];
        if (myBetBtnClickPlayer == nil) {
            NSLog(@"Error loading audio file Button Click");
        } else {
//            myBetBtnClickPlayer.delegate = self;
            myBetBtnClickPlayer.numberOfLoops = 0;
            [myBetBtnClickPlayer play];
        }
        [soundBetBtnClickUrl release];
    }
}

+(void)playJetSound
{
    
}

+(void)playFactorySound
{
    if (1/*isSoundOn*/) {
        NSString *fileName = [[NSString alloc] initWithString:buildSound];
        NSString *audioFile = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"]];
        [fileName release];
        NSURL *soundBetBtnClickUrl = [[NSURL alloc] initFileURLWithPath:audioFile];
        [audioFile release];
        NSError *error;
        AVAudioPlayer *myBetBtnClickPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundBetBtnClickUrl error:&error];
        if (myBetBtnClickPlayer == nil) {
            NSLog(@"Error loading audio file Button Click");
        } else {
            //            myBetBtnClickPlayer.delegate = self;
            myBetBtnClickPlayer.numberOfLoops = 0;
            [myBetBtnClickPlayer play];
        }
        [soundBetBtnClickUrl release];
    }
}

@end
