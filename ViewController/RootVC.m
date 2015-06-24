//
//  RootVC.m
//  GDFamily
//
//  Created by Sicong Qian on 15/6/18.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "RootVC.h"
#import "GDFSearchBar.h"
@interface RootVC ()

@end

@implementation RootVC

-(void)_setup{
    self.view.backgroundColor = [UIColor yellowColor];
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
@end
