//
//  GDFSlideController.m
//  GDFamily
//
//  Created by Sicong Qian on 15/6/19.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "GDFSlideController.h"

static const CGFloat kICSDrawerControllerDrawerDepth = 260.0f;
static const CGFloat kICSDrawerControllerLeftViewInitialOffset = -60.0f;
static const NSTimeInterval kICSDrawerControllerAnimationDuration = 0.5;
static const CGFloat kICSDrawerControllerOpeningAnimationSpringDamping = 0.7f;
static const CGFloat kICSDrawerControllerOpeningAnimationSpringInitialVelocity = 0.1f;
static const CGFloat kICSDrawerControllerClosingAnimationSpringDamping = 1.0f;
static const CGFloat kICSDrawerControllerClosingAnimationSpringInitialVelocity = 0.5f;

typedef NS_ENUM(NSUInteger, ICSDrawerControllerState)
{
    ICSDrawerControllerStateClosed = 0,
    ICSDrawerControllerStateOpening,
    ICSDrawerControllerStateOpen,
    ICSDrawerControllerStateClosing
};

@interface GDFSlideController () <UIGestureRecognizerDelegate>

@end

@implementation GDFSlideController{
    UIView *leftView;
    UIView *centerView;
    
    UITapGestureRecognizer *tapGestureRecognizer;
    UIPanGestureRecognizer *panGestureRecognizer;
    CGPoint panGestureStartLocation;
    
    
}

@synthesize leftViewController,centerViewController;

- (id)initWithLeftViewController:(UIViewController *)leftViewController_
            centerViewController:(UIViewController *)centerViewController_{
    if (leftViewController_&&centerViewController_) {
        NSLog(@"do not accept nil params.");
        return nil;
    }
    self = [super init];
    if (self) {
        leftViewController = leftViewController_;
        centerViewController = centerViewController_;
    }
    return self;
}

- (void)addCenterViewController{
    [self addChildViewController:self.centerViewController];
    self.centerViewController.view.frame = self.view.bounds;
    [centerView addSubview:self.centerViewController.view];
    [centerViewController didMoveToParentViewController:self];
}
- (void)setupGestureRecognizers{
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    panGestureRecognizer.maximumNumberOfTouches = 1;
    panGestureRecognizer.delegate = self;
    
    [centerView addGestureRecognizer:panGestureRecognizer];
}
- (void)tapGestureRecognized:(UITapGestureRecognizer *)tapGestureRecognizer{
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        NSLog(@"is not a UIPanGestureRecognizer.");
        return NO;
    }
    NSParameterAssert([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]);
    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self.view];
    
    if (self.drawerState == ICSDrawerControllerStateClosed && velocity.x > 0.0f) {
        return YES;
    }
    else if (self.drawerState == ICSDrawerControllerStateOpen && velocity.x < 0.0f) {
        return YES;
    }
    
    return NO;
}
- (void)panGestureRecognized:(UIPanGestureRecognizer *)panGestureRecognizer_{
    UIGestureRecognizerState state = panGestureRecognizer_.state;
    CGPoint location = [panGestureRecognizer_ locationInView:self.view];
    CGPoint velocity = [panGestureRecognizer_ velocityInView:self.view];
    
    switch (state) {
            
        case UIGestureRecognizerStateBegan:
            self.panGestureStartLocation = location;
            if (self.drawerState == ICSDrawerControllerStateClosed) {
                [self willOpen];
            }
            else {
                [self willClose];
            }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGFloat delta = 0.0f;
            if (self.drawerState == ICSDrawerControllerStateOpening) {
                delta = location.x - self.panGestureStartLocation.x;
            }
            else if (self.drawerState == ICSDrawerControllerStateClosing) {
                delta = kICSDrawerControllerDrawerDepth - (self.panGestureStartLocation.x - location.x);
            }
            
            CGRect l = self.leftView.frame;
            CGRect c = self.centerView.frame;
            if (delta > kICSDrawerControllerDrawerDepth) {
                l.origin.x = 0.0f;
                c.origin.x = kICSDrawerControllerDrawerDepth;
            }
            else if (delta < 0.0f) {
                l.origin.x = kICSDrawerControllerLeftViewInitialOffset;
                c.origin.x = 0.0f;
            }
            else {
                // While the centerView can move up to kICSDrawerControllerDrawerDepth points, to achieve a parallax effect
                // the leftView has move no more than kICSDrawerControllerLeftViewInitialOffset points
                l.origin.x = kICSDrawerControllerLeftViewInitialOffset
                - (delta * kICSDrawerControllerLeftViewInitialOffset) / kICSDrawerControllerDrawerDepth;
                
                c.origin.x = delta;
            }
            
            self.leftView.frame = l;
            self.centerView.frame = c;
            
            break;
        }
            
        case UIGestureRecognizerStateEnded:
            
            if (self.drawerState == ICSDrawerControllerStateOpening) {
                CGFloat centerViewLocation = self.centerView.frame.origin.x;
                if (centerViewLocation == kICSDrawerControllerDrawerDepth) {
                    // Open the drawer without animation, as it has already being dragged in its final position
                    [self setNeedsStatusBarAppearanceUpdate];
                    [self didOpen];
                }
                else if (centerViewLocation > self.view.bounds.size.width / 3
                         && velocity.x > 0.0f) {
                    // Animate the drawer opening
                    [self animateOpening];
                }
                else {
                    // Animate the drawer closing, as the opening gesture hasn't been completed or it has
                    // been reverted by the user
                    [self didOpen];
                    [self willClose];
                    [self animateClosing];
                }
                
            } else if (self.drawerState == ICSDrawerControllerStateClosing) {
                CGFloat centerViewLocation = self.centerView.frame.origin.x;
                if (centerViewLocation == 0.0f) {
                    // Close the drawer without animation, as it has already being dragged in its final position
                    [self setNeedsStatusBarAppearanceUpdate];
                    [self didClose];
                }
                else if (centerViewLocation < (2 * self.view.bounds.size.width) / 3
                         && velocity.x < 0.0f) {
                    // Animate the drawer closing
                    [self animateClosing];
                }
                else {
                    // Animate the drawer opening, as the opening gesture hasn't been completed or it has
                    // been reverted by the user
                    [self didClose];
                    
                    // Here we save the current position for the leftView since
                    // we want the opening animation to start from the current position
                    // and not the one that is set in 'willOpen'
                    CGRect l = self.leftView.frame;
                    [self willOpen];
                    self.leftView.frame = l;
                    
                    [self animateOpening];
                }
            }
            break;
            
        default:
            break;
    }
}

#pragma mark - uiviewcontroller method
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // Initialize left and center view containers
    leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    centerView = [[UIView alloc] initWithFrame:self.view.bounds];
    leftView.autoresizingMask = self.view.autoresizingMask;
    centerView.autoresizingMask = self.view.autoresizingMask;
    
    // Add the center view container
    [self.view addSubview:centerView];
    
    // Add the center view controller to the container
    [self addCenterViewController];
    
    [self setupGestureRecognizers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
