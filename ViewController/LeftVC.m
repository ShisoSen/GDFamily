//
//  LeftVC.m
//  GDFamily
//
//  Created by Sicong Qian on 15/6/23.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "LeftVC.h"
#import "UIImageView+LBBlurredImage.h"

static const float kGDFScrollViewOffsetRange = 110.0;

@interface LeftVC ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation LeftVC{
    UITableView *table;
    UIView *header;
    UIView *footer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGSize s = self.view.frame.size;
    UIImageView *backgroundView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    backgroundView.image = [UIImage imageNamed:@"example"];
    [self.view addSubview:backgroundView];

    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, s.width, s.height-44) style:UITableViewStylePlain];
    table.backgroundColor = [UIColor clearColor];
    table.delegate = self;
    table.dataSource = self;
    table.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 159.0f)];
        float diameter = 100.0f;
        CGPoint imgOrg = CGPointMake(10, 40);
        float spacing = 5.0f;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imgOrg.x, imgOrg.y, diameter, diameter)];
//        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"avatar.jpg"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imgOrg.x+diameter+spacing*2, imgOrg.y+diameter/2-spacing/2-24, 0, 24)];
        label.text = @"Roman Efimov";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [label sizeToFit];
//        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        
        [view addSubview:imageView];
        [view addSubview:label];
        imageView.backgroundColor = [UIColor greenColor];
        view;
    });
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, s.width, 69)];
    header.backgroundColor = [UIColor grayColor];
    header.alpha = 0.0f;
    [self.view addSubview:header];
    UIButton *h_bt1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    h_bt1.frame = CGRectMake(s.width-60-40, header.frame.size.height-40, 30, 30);
    [self.view addSubview:h_bt1];
    
    footer = [[UIView alloc]initWithFrame:CGRectMake(0, s.height-44, s.width, 44)];
    footer.backgroundColor = [UIColor clearColor];
    [self.view addSubview:footer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex{
    return 0.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    lg;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.sliderController open];
}
#pragma mark -UITableView Datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"Home", @"Profile", @"Chats"];
        cell.textLabel.text = titles[indexPath.row];
    } else {
        NSArray *titles = @[@"John Appleseed", @"John Doe", @"Test User"];
        cell.textLabel.text = titles[indexPath.row];
    }
    return cell;
}
#pragma mark -scrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    header.alpha = scrollView.contentOffset.y/kGDFScrollViewOffsetRange;
    NSLog(@"header alpha: %f",header.alpha);
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
