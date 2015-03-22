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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpForDismissKeyboard];
    
    // add a moving image
//    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(287, 177, 15, 15)];
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 405, 15, 15)];
    
    imgView.image = [UIImage imageNamed:@"first"];
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
    
}

- (IBAction)click2:(id)sender {
    // 播放音频按钮
    
}

- (IBAction)click3:(id)sender {
    // 播放视频按钮
    
}

- (IBAction)click4:(id)sender {
    // 评分按钮
    
}

- (IBAction)click5:(id)sender {
    // 播放音频按钮
    
}

- (IBAction)click6:(id)sender {
    // 播放视频按钮
    
}

- (IBAction)click7:(id)sender {
    // 评分按钮
    
}

- (IBAction)click8:(id)sender {
   // 播放音频按钮
    
}
- (IBAction)click9:(id)sender {
    // 播放视频按钮
    
}
@end
