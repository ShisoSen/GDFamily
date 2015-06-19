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
@interface RootVC ()

@end

@implementation RootVC

-(void)_setup{

}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
