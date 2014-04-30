//
//  ViewController.h
//  newermagic8
//
//  Created by Spencer McCullough on 4/24/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *sayingLabel;
    
    IBOutlet UIImageView *magicBall;
    
    IBOutlet UIImageView *triangle;
    
    
    NSArray *magicBallsayings;
    
    
}

@property (retain, nonatomic) IBOutlet UILabel *sayingLabel;



@end
