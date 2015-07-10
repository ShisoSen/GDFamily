//
//  BDMapVC.h
//  GDFamily
//
//  Created by Sicong Qian on 15/7/9.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BMKMapView;

@interface BDMapVC : UIViewController
@property (nonatomic,copy) BMKMapView* mapView;

-(void)startLocModeFollow;
-(void)startLocModeNone;
-(void)startLocModeFollowWithHeading;
-(void)addCurrentLocPoint;
@end
