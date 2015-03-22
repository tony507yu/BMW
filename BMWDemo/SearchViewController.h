//
//  SearchViewController.h
//  BMWDemo
//
//  Created by Yuming Tao on 24/01/15.
//  Copyright (c) 2015 THU-IHFE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar * searchBar;
@property (weak, nonatomic) IBOutlet UIButton *examplePlaceButton1;
@property (weak, nonatomic) IBOutlet UIButton *examplePlaceButton2;

@end
