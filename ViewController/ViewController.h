//
//  ViewController.h
//  GDFamily
//
//  Created by Sicong Qian on 15/6/25.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "GDFSlideController.h"

@interface ViewController : UIViewController<GDFSlideControllerChild,GDFSlideControllerStatus>
@property (nonatomic,weak) GDFSlideController *sliderController;
@end
