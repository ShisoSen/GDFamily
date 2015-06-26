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

@interface RootVC ()

@end

@implementation RootVC

-(void)_setup{
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
    button.center = self.view.center;
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)buttonClick:(id)sender{
    ViewController *vc = [[ViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.sliderController replaceLeftViewControllerWithViewController:vc];
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
