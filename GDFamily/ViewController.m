//
//  ViewController.m
//  GDFamily
//
//  Created by Sicong Qian on 15/6/15.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "GDFSearchBar.h"

@interface ViewController ()<MAMapViewDelegate,GDFSearchBarDelegate>

@end

@implementation ViewController{
    MAMapView *_mapView;
    GDFSearchBar *searchBarWithDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.pausesLocationUpdatesAutomatically = NO;
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
//    [self.view addSubview:_mapView];
    
    searchBarWithDelegate = [[GDFSearchBar alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) - 40.0, 140.0, 44.0, 34.0)];
    searchBarWithDelegate.delegate = self;
    
    [self.view addSubview:searchBarWithDelegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
static long record = 0;
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        record++;
        NSLog(@"record: %ld",record);
    }
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    /* 自定义userLocation对应的annotationView. */
    if ([annotation isKindOfClass:[MAUserLocation class]])
    {
        static NSString *userLocationStyleReuseIndetifier = @"userLocationStyleReuseIndetifier";
        MAAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:userLocationStyleReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:userLocationStyleReuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"userPosition"];
        
        return annotationView;
    }
    return nil;
}
#pragma mark - search bar delegate

- (CGRect)destinationFrameForSearchBar:(GDFSearchBar *)searchBar
{
    return CGRectMake(20.0, 140.0, CGRectGetWidth(self.view.bounds) - 40.0, 34.0);
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
