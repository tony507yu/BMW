//
//  NavViewController.m
//  BMWDemo
//
//  Created by Yuming Tao on 28/01/15.
//  Copyright (c) 2015 THU-IHFE. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController
@synthesize movieView;
@synthesize player;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpForDismissKeyboard];
    
    // add a moving image
//    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(287, 177, 15, 15)];
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 405, 15, 15)];
    
    // 小车的图标
    imgView.image = [UIImage imageNamed:@"end.png"];
    [self.view addSubview:imgView];
    
    [UIView animateWithDuration:4 animations:^{
        
        CGRect frame = imgView.frame;
        frame.origin.x = 65;
        imgView.frame = frame;
        
    }completion:^(BOOL finished) {
        
        if (finished) {
            
            // add three btns
            self.btn1.alpha = 1;
            self.btn2.alpha = 1;
            self.btn3.alpha = 1;
            
            [UIView animateWithDuration:1 animations:^{
                
                CGRect frame = imgView.frame;
                frame.origin.x = 72;
                frame.origin.y = 390;
                imgView.frame = frame;
                
            }completion:^(BOOL finished) {
                
                if (finished) {
                    
                    [UIView animateWithDuration:4 animations:^{
                        
                        CGRect frame = imgView.frame;
                        frame.origin.x = 72;
                        frame.origin.y = 325;
                        imgView.frame = frame;
                        
                    }completion:^(BOOL finished) {
                        
                        if (finished) {
                            
                            self.btn4.alpha = 1;
                            self.btn5.alpha = 1;
                            self.btn6.alpha = 1;
                            
                            [UIView animateWithDuration:1 animations:^{
                                
                                CGRect frame = imgView.frame;
                                frame.origin.x = 86;
                                frame.origin.y = 310;
                                imgView.frame = frame;
                                
                            }completion:^(BOOL finished) {
                                
                                if (finished) {
                                    
                                    [UIView animateWithDuration:6 animations:^{
                                        
                                        CGRect frame = imgView.frame;
                                        frame.origin.x = 270;
                                        frame.origin.y = 310;
                                        imgView.frame = frame;

                                        
                                    }completion:^(BOOL finished) {
                                        
                                        if (finished) {
                                            
                                            // add three btns
                                            self.btn7.alpha = 1;
                                            self.btn8.alpha = 1;
                                            self.btn9.alpha = 1;
                                            
                                            [UIView animateWithDuration:1 animations:^{
                                                
                                                CGRect frame = imgView.frame;
                                                frame.origin.x = 287;
                                                frame.origin.y = 293;
                                                imgView.frame = frame;

                                                
                                            }completion:^(BOOL finishe) {
                                                
                                                if (finished) {
                                                    
                                                    [UIView animateWithDuration:5 animations:^{
                                                        
                                                        CGRect frame = imgView.frame;
                                                        frame.origin.x = 287;
                                                        frame.origin.y = 177;
                                                        imgView.frame = frame;

                                                        
                                                    }];
                                                    
                                                }
                                                
                                            }];
                                        }
                                        
                                    }];
                                }
                                
                                
                            }];
                        }
                        
                    }];
                    
                }
                
                
            }];
        }
        
    }];
    [[ NSNotificationCenter   defaultCenter]  addObserver:self
                                                selector : @selector(movieFinishedCallback:) name: MPMoviePlayerPlaybackDidFinishNotification object:player];
    self.movieView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setUpForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view removeGestureRecognizer:singleTapGR];
                }];
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    //[self.view endEditing:YES];
    [self.navigationItem.titleView endEditing:YES];
    [self.searchBar endEditing:YES];
}

- (IBAction)click1:(id)sender {
    // 评分按钮
    self.player = [[MPMoviePlayerController alloc] init];
    NSString * moviePath = [[NSBundle mainBundle] pathForResource:@"movie1" ofType:@"mov"];
    self.player.contentURL = [NSURL fileURLWithPath:moviePath];
    // END:viewDidLoad1
    
	 	 // START_HIGHLIGHT
    self.player.view.frame = self.movieView.bounds;
    self.player.view.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    [self.player prepareToPlay];
    
    [self.movieView addSubview:player.view];
    self.movieView.hidden = NO;
    [self.player play];
}

- (IBAction)click2:(id)sender {
    // 播放音频按钮
    [self showHudCompleteWithMessage:@"+3"];
    [HUD hide:YES afterDelay:3];
}

- (IBAction)click3:(id)sender {
    // 播放视频按钮
    
}

- (IBAction)click4:(id)sender {
    // 评分按钮
    self.player = [[MPMoviePlayerController alloc] init];
    NSString * moviePath = [[NSBundle mainBundle] pathForResource:@"movie1" ofType:@"mov"];
    self.player.contentURL = [NSURL fileURLWithPath:moviePath];
    // END:viewDidLoad1
    
	 	 // START_HIGHLIGHT
    self.player.view.frame = self.movieView.bounds;
    self.player.view.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    [self.player prepareToPlay];
    
    [self.movieView addSubview:player.view];
    self.movieView.hidden = NO;
    [self.player play];
}

- (IBAction)click5:(id)sender {
    // 播放音频按钮
    
}

- (IBAction)click6:(id)sender {
    // 播放视频按钮
    
}

- (IBAction)click7:(id)sender {
    // 评分按钮
    self.player = [[MPMoviePlayerController alloc] init];
    NSString * moviePath = [[NSBundle mainBundle] pathForResource:@"movie1" ofType:@"mov"];
    self.player.contentURL = [NSURL fileURLWithPath:moviePath];
    // END:viewDidLoad1
    
	 	 // START_HIGHLIGHT
    self.player.view.frame = self.movieView.bounds;
    self.player.view.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    [self.player prepareToPlay];
    
    [self.movieView addSubview:player.view];
     self.movieView.hidden = NO;
    [self.player play];
}

- (IBAction)click8:(id)sender {
   // 播放音频按钮
    
}
- (IBAction)click9:(id)sender {
    // 播放视频按钮
    
}

- (void)movieFinishedCallback:(id)userInfo{
    NSArray * views = [self.movieView subviews];
    for (UIView * view in views) {
        [view removeFromSuperview];
    }
    self.movieView.hidden = YES;
}

# pragma mark -
# pragma mark HUD methods

-(void)showHudWithSimpleMessage:(NSString *)message
{
    if (!HUD){
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.navigationController.view addSubview:HUD];
    }
    HUD.mode = MBProgressHUDAnimationFade;
    HUD.labelText = message;
    HUD.delegate = self;
    [HUD show:YES];
}



-(void)showHudWithMessage:(NSString *)message
{
    if (!HUD){
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.navigationController.view addSubview:HUD];
    }
    HUD.mode = MBProgressHUDAnimationFade;
    HUD.labelText = message;
    HUD.delegate = self;
    [HUD show:YES];
}

-(void)showHudThenHideWithMessage:(NSString *)message
{
    if (!HUD){
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.navigationController.view addSubview:HUD];
    }
    HUD.mode = MBProgressHUDAnimationFade;
    HUD.labelText = message;
    [HUD show:YES];
    HUD.delegate = self;
    [HUD hide:YES afterDelay:3];
}

-(void)showHudCompleteWithMessage:(NSString *)message
{
    if (!HUD){
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.navigationController.view addSubview:HUD];
    }
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.delegate = self;
    HUD.labelText = message ? message : NSLocalizedString(@"Completed", @"Hubview message completed");
    [HUD show:YES];
    [HUD hide:YES afterDelay:1.5];
}

- (void)hideHud
{
    if(HUD){
        [HUD hide:YES];
    }
}

#pragma mark -
#pragma mark MBProgressHUDDelegate methods
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    HUD = nil;
}

@end
