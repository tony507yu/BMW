//
//  SearchViewController.m
//  BMWDemo
//
//  Created by Yuming Tao on 24/01/15.
//  Copyright (c) 2015 THU-IHFE. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 0, 100, 30)];
    self.navigationItem.titleView = self.searchBar;
    self.searchBar.delegate = self;
    
    self.examplePlaceButton1.layer.borderWidth = 1.0f;
    self.examplePlaceButton1.layer.borderColor = [UIColor colorWithRed:123.0f/255.0f green:208.0f/255.0f blue:229.0f/255.0f alpha:1.0f].CGColor;
    self.examplePlaceButton1.layer.cornerRadius = 3.0f;
    
    self.examplePlaceButton2.layer.borderWidth = 1.0f;
    self.examplePlaceButton2.layer.borderColor = [UIColor colorWithRed:123.0f/255.0f green:208.0f/255.0f blue:229.0f/255.0f alpha:1.0f].CGColor;
    self.examplePlaceButton2.layer.cornerRadius = 3.0f;
    
    
    [self setUpForDismissKeyboard];
    
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

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.view endEditing:YES];
    [searchBar resignFirstResponder];
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
    [self.navigationItem.titleView endEditing:YES];
}



@end
