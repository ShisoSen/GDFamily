//
//  RootVC.m
//  GDFamily
//
//  Created by Sicong Qian on 15/6/18.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "RootVC.h"
#import "GDFSearchBar.h"
#import "ViewController.h"
#import "BDMapVC.h"

@interface RootVC ()

@end

@implementation RootVC{
    CGSize size;
}

-(void)_setup{
    size = [UIScreen mainScreen].bounds.size;
    
    BDMapVC *bdmap = [[BDMapVC alloc]init];
    bdmap.view.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:bdmap.view];
    
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, size.width, 69)];
    [navBar setBarTintColor:[UIColor colorWithRed:0.207 green:0.860 blue:1.000 alpha:1.000]];
    [navBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    navBar.translucent = YES;
    [self.view addSubview:navBar];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(setBtClk:)];
    UINavigationItem *items = [[UINavigationItem alloc]initWithTitle:@"title"];
    items.leftBarButtonItem = leftItem;
    [navBar pushNavigationItem:items animated:YES];
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, size.height-44, size.width, 44)];
    footView.backgroundColor = [UIColor colorWithRed:0.225 green:0.543 blue:1.000 alpha:1.000];
    footView.alpha = 0.8f;
    [self.view addSubview:footView];
}
-(void)setBtClk:(id)sender{
    //    ViewController *vc = [[ViewController alloc]init];
    //    vc.view.backgroundColor = [UIColor redColor];
    //    [self.sliderController replaceLeftViewControllerWithViewController:vc];
    if (self.sliderController.drawerState == GDFDrawerControllerStateClosed) {
        [self.sliderController open];
    }else if (self.sliderController.drawerState == GDFDrawerControllerStateOpen){
        [self.sliderController close];
    }
}
-(void)viewWillAppear:(BOOL)animated{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -GDFSlideControllerStatus
- (void)slideControllerWillOpen:(GDFSlideController *)slideController{
    lg;
}
- (void)slideControllerDidOpen:(GDFSlideController *)slideController{
    lg;
}
- (void)slideControllerWillClose:(GDFSlideController *)slideController{
    lg;
}
- (void)slideControllerDidClose:(GDFSlideController *)slideController{
    lg;
}
- (void)slideControllerTapClose:(GDFSlideController *)slideController{
    lg;
    
    if (self.childCenter.sliderController.drawerState == GDFDrawerControllerStateOpen) {
        [self.childCenter.sliderController close];
    }
}
@end
