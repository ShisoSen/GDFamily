//
//  RootVC.m
//  GDFamily
//
//  Created by Sicong Qian on 15/6/18.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "RootVC.h"
#import "GDFSearchBar.h"

#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#define lg NSLog(@"%s",__func__)
#define lf(x) NSLog(@"%s : %@",#x,x)
#else
#define NSLog(...) {}
#define lg {}
#define lf(x) {}
#endif
@interface RootVC ()<GDFSearchBarDelegate>

@end

@implementation RootVC

-(void)_setup{
    self.title =@"GDFamily";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"title_bar_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnClicked)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"NavBarIconSearch_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnClicked)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7){
        self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    }
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    GDFSearchBar *searchBar = [[GDFSearchBar alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) - 40.0, 69, 44, 34)];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - BtnClick

-(void)leftBtnClicked {
    lg;
    self.navigationController.navigationBar.frame = CGRectMake(0, -20, 320, 49);
//    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
//                     animations:^{
//                         self.navigationController.navigationBar.frame = CGRectMake(0, -self.navigationController.view.bounds.size.height, 320, 49);}
//                     completion:^(BOOL completion){
//                         
//                     }];
}

-(void)rightBtnClicked {
    lg;
    self.navigationController.view.frame = CGRectMake(50, self.view.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
}
#pragma mark - search bar delegate

- (CGRect)destinationFrameForSearchBar:(GDFSearchBar *)searchBar
{
    return CGRectMake(20.0, 69, CGRectGetWidth(self.view.bounds) - 40.0, 34.0);
}

- (void)searchBar:(GDFSearchBar *)searchBar willStartTransitioningToState:(GDFSearchBarState)destinationState
{
    // Do whatever you deem necessary.
}

- (void)searchBar:(GDFSearchBar *)searchBar didEndTransitioningFromState:(GDFSearchBarState)previousState
{
    // Do whatever you deem necessary.
}

- (void)searchBarDidTapReturn:(GDFSearchBar *)searchBar
{
    // Do whatever you deem necessary.
    // Access the text from the search bar like searchBar.searchField.text
}

- (void)searchBarTextDidChange:(GDFSearchBar *)searchBar
{
    // Do whatever you deem necessary.
    // Access the text from the search bar like searchBar.searchField.text
}
@end
