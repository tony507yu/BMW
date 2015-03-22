//
//  InitInfoViewController.m
//  BMWDemo
//
//  Created by Yuming Tao on 24/01/15.
//  Copyright (c) 2015 THU-IHFE. All rights reserved.
//

#import "InitInfoViewController.h"

@interface InitInfoViewController ()



@end

@implementation InitInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.averageDistanceField.delegate = self;
    self.drivingAgeField.delegate = self;
    self.totalDistanceField.delegate = self;
    self.nameField.delegate = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(fillPersonalInformationCompleted)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor colorWithRed:106/255.0 green:195/255.0 blue:219/255.0 alpha:1.0]];
    
    [self setUpForDismissKeyboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fillPersonalInformationCompleted {
    // Before pop to root view, save the user entered data here
    
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * rootVC = [storyboard instantiateViewControllerWithIdentifier:@"rootViewController"];
    [self presentViewController:rootVC animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //resign keyboard
    [textField resignFirstResponder];
    return YES;
}

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
    [self.view endEditing:YES];
}

@end
