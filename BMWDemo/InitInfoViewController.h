//
//  InitInfoViewController.h
//  BMWDemo
//
//  Created by Yuming Tao on 24/01/15.
//  Copyright (c) 2015 THU-IHFE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitInfoViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *drivingAgeField;
@property (weak, nonatomic) IBOutlet UITextField *totalDistanceField;
@property (weak, nonatomic) IBOutlet UITextField *averageDistanceField;

- (void)fillPersonalInformationCompleted;

@end
