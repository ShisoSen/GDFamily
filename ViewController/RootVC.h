//
//  RootVC.h
//  GDFamily
//
//  Created by Sicong Qian on 15/6/18.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "GDFBaseVC.h"
#import "GDFSlideController.h"
@interface RootVC :GDFBaseVC <GDFSlideControllerChild,GDFSlideControllerStatus>

@property (nonatomic,weak) GDFSlideController *sliderController;
@property (nonatomic,weak) UIViewController<GDFSlideControllerChild,GDFSlideControllerStatus> *childCenter;
@end
