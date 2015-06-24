//
//  LeftVC.h
//  GDFamily
//
//  Created by Sicong Qian on 15/6/23.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "GDFBaseVC.h"
#import "GDFSlideController.h"

@interface LeftVC : GDFBaseVC <GDFSlideControllerChild,GDFSlideControllerStatus>

@property (nonatomic,weak) GDFSlideController *sliderController;
@end
