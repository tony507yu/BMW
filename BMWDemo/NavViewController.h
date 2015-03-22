//
//  NavViewController.h
//  BMWDemo
//
//  Created by Yuming Tao on 28/01/15.
//  Copyright (c) 2015 THU-IHFE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MBProgressHUD.h"

@interface NavViewController : UIViewController<MBProgressHUDDelegate> {
    UIImageView *imgView;
    UIView * movieView;
    // START_HIGHLIGHT
    MPMoviePlayerController *player;
    MBProgressHUD * HUD;

}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet UIView *movieView;
@property (nonatomic, retain) MPMoviePlayerController *player;

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;

@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;

- (IBAction)click1:(id)sender;
- (IBAction)click2:(id)sender;
- (IBAction)click3:(id)sender;

- (IBAction)click4:(id)sender;
- (IBAction)click5:(id)sender;
- (IBAction)click6:(id)sender;

- (IBAction)click7:(id)sender;
- (IBAction)click8:(id)sender;
- (IBAction)click9:(id)sender;

@end
