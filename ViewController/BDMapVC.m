//
//  BDMapVC.m
//  GDFamily
//
//  Created by Sicong Qian on 15/7/9.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "BDMapVC.h"
#import <BaiduMapAPI/BMapKit.h>
#define BDMapKey @"Bhg6IxZes8zzEGxpHM2O3qSU"

@interface BDMapVC ()<BMKMapViewDelegate,BMKGeneralDelegate,BMKLocationServiceDelegate>

@end

@implementation BDMapVC{
    BMKLocationService* lcoService;
}
@synthesize mapView;

-(instancetype)init{
    self = [super init];
    if (self) {
        [self _setUp];
    }
    return self;
}
-(void)_setUp{
    // 要使用百度地图，请先启动BaiduMapManager
    BMKMapManager * mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [mapManager start:BDMapKey generalDelegate:self];
    
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    mapView = [[BMKMapView alloc]init];
    mapView.zoomLevel = 18;
    [self _openUserLocationService];
}
-(void)_openUserLocationService{
    //设置定位精确度，默认：kCLLocationAccuracyBest
    [BMKLocationService setLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    //指定最小距离更新(米)，默认：kCLDistanceFilterNone
    [BMKLocationService setLocationDistanceFilter:100.f];
    
    //初始化BMKLocationService
    lcoService = [[BMKLocationService alloc]init];
    lcoService.delegate = self;
    //启动LocationService
    [lcoService startUserLocationService];
}
#pragma mark -view controller
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = mapView;
    mapView.userTrackingMode = BMKUserTrackingModeFollow;
    mapView.showsUserLocation = YES;//显示定位图层
}

- (void)viewWillAppear:(BOOL)animated{
    [mapView viewWillAppear];
    mapView.frame = self.view.frame;
    mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

-(void)viewWillDisappear:(BOOL)animated{
    [mapView viewWillDisappear];
    mapView.delegate = nil; // 不用时，置nil
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -BMKMapViewDelegate
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView{
    lg;
}
- (void)mapView:(BMKMapView *)mapView onDrawMapFrame:(BMKMapStatus*)status{
    lg;
}
- (void)mapView:(BMKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    
}
- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    lg;
}
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation{
    return nil;
}
- (void)mapView:(BMKMapView *)mapView didAddAnnotationViews:(NSArray *)views{
    
}
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{
    
}
-(void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view{
    
}
- (void)mapView:(BMKMapView *)mapView annotationView:(BMKAnnotationView *)view didChangeDragState:(BMKAnnotationViewDragState)newState
   fromOldState:(BMKAnnotationViewDragState)oldState{
    
}
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view{
    
}
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay{
    return nil;
}
- (void)mapView:(BMKMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews{
    
}
- (void)mapView:(BMKMapView *)mapView onClickedBMKOverlayView:(BMKOverlayView *)overlayView{
    
}
- (void)mapView:(BMKMapView *)mapView onClickedMapPoi:(BMKMapPoi*)mapPoi{
    
}
- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate{
    
}
- (void)mapview:(BMKMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate{
    lg;
}
- (void)mapview:(BMKMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate{
    lg;
}
- (void)mapStatusDidChanged:(BMKMapView *)mapView{
    
}
#pragma mark -BMKGeneralDelegate
- (void)onGetNetworkState:(int)iError{
    lg;
}
- (void)onGetPermissionState:(int)iError{
    lg;
}
#pragma mark -BMKLocationServiceDelegate
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation{
    NSLog(@"heading is %@",userLocation.heading);
    [mapView updateLocationData:userLocation];
}
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [mapView updateLocationData:userLocation];
}
@end
