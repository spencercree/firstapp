//
//  ViewController.m
//  newermagic8
//
//  Created by Spencer McCullough on 4/24/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize sayingLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    magicBallsayings = [NSArray arrayWithObjects:
                        @"It is certain",
                        @"It is decidedly so",
                        @"Without a doubt",
                        @"Yes definitely",
                        @"You may rely on it",
                        @"As I see it, yes",
                        @"Most likely",
                        @"Outlook good",
                        @"Yes",
                        @"Signs point to yes",
                        @"Reply hazy try again",
                        @"Ask again later",
                        @"Better not tell you now",
                        @"Cannot predict now",
                        @"Concentrate and ask again",
                        @"Don't count on it",
                        @"My reply is no",
                        @"My sources say no",
                        @"Outlook not so good",
                        @"Very doubtful", nil];
    
    sayingLabel.alpha = 0.0;

}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    sayingLabel.alpha = 0.0;
    [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(shakeRight) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:.6 target:self selector:@selector(shakeLeft) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:.6 target:self selector:@selector(changeText) userInfo:nil repeats:NO];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.2];
    CGRect frame = magicBall.frame;
    frame.origin.x -= 10;
    magicBall.frame = frame;
    [UIView commitAnimations];
    NSString *randomSaying = [magicBallsayings objectAtIndex:arc4random()%[magicBallsayings count]];
    sayingLabel.text = randomSaying;
}

-(void)shakeRight
{
    sayingLabel.alpha = 0.0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.4];
    CGRect frame = magicBall.frame;
    frame.origin.x += 20;
    magicBall.frame = frame;
    [UIView commitAnimations];
    
    triangle.alpha = 0.0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.4];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    transition.delegate = self;
    [self.view.layer addAnimation:transition forKey:nil];
    triangle.hidden = YES;
    triangle.hidden = NO;
    [UIView commitAnimations];
    
}
-(void)shakeLeft
{
    sayingLabel.alpha = 0.0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.2];
    CGRect frame = magicBall.frame;
    frame.origin.x -= 10;
    magicBall.frame = frame;
    [UIView commitAnimations];

}
-(void)changeText
{
    [UIView beginAnimations:nil context:nil];
    sayingLabel.alpha = 1.0;
    [UIView commitAnimations];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    transition.delegate = self;
    [self.view.layer addAnimation:transition forKey:nil];
    triangle.hidden = YES;
    triangle.hidden = NO;
    triangle.alpha = 1.0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.4];
    [UIView commitAnimations];
    
}



    -(void)didReceiveMemoryWarning;
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    @end