//
//  LineChartViewController.m
//  LineChart
//
//  Created by chao on 2021/4/26.
//

#import "LineChartViewController.h"
#import "HistoryChart.h"
#import "NavBarView.h"

@interface LineChartViewController ()<HistoryChartDelegate>
{
    HistoryChart *_hChartView;
}

@property (strong, nonatomic) UIScrollView *myScrollView;
@property (strong, nonatomic) NSMutableArray *listMuAry1;
@property (strong, nonatomic) NSMutableArray *listMuAry2;
@property (strong, nonatomic) NSMutableArray *listMuAry3;
@property (strong, nonatomic) NSMutableArray *listMuAry4;

@property (strong, nonatomic) NSMutableArray *columnData;

@property (strong, nonatomic) UIButton *addButton;
@end

@implementation LineChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NavBarView *navBarView = [NavBarView navBarView];
    navBarView.navtitle = @"统计图+柱状图";
    navBarView.CloseBlock = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    [self.view addSubview:navBarView];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.addButton];
    
    
    self.listMuAry1 = NSMutableArray.array;
    self.listMuAry2 = NSMutableArray.array;
    self.listMuAry3 = NSMutableArray.array;
    self.listMuAry4 = NSMutableArray.array;
    
    self.columnData = NSMutableArray.array;
    
    for (NSInteger i=0; i<10; i++) {
        [self addARecord];
    }
    
    [self.view addSubview:self.myScrollView];
    
    
    CGFloat w = 7 *40 + 40 +40;
    HistoryChart *hChartView = [[HistoryChart alloc] initWithFrame:CGRectMake(0, 0, w, 400)];
    hChartView.delegate = self;
//    hChartView.isCurve = YES;
 //    hChartView.backgroundColor = UIColor.lightGrayColor;
    [self.myScrollView addSubview:hChartView];
    hChartView.row = 6;
    hChartView.valueDataAry1 = self.listMuAry1;
    hChartView.valueDataAry2 = self.listMuAry2;
    hChartView.valueDataAry3 = self.listMuAry3;
    hChartView.valueDataAry4 = self.listMuAry4;
    hChartView.columnData = self.columnData;
    self.myScrollView.contentSize = CGSizeMake(w, 400);
    _hChartView = hChartView;
    [hChartView reloadData];
    
}

- (UIScrollView *)myScrollView
{
    if (_myScrollView) {
        return _myScrollView;
    }
    _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 400)];
    _myScrollView.showsVerticalScrollIndicator = NO;
    _myScrollView.showsHorizontalScrollIndicator = NO;
    return _myScrollView;
}
- (void)addARecord
{
    NSArray *salesAry = @[@"0",@"3000",@"26300",@"5000",@"6000",@"6000",@"9800"];
    int x = arc4random() % salesAry.count;
    [self.listMuAry1 addObject:salesAry[x]];
    
    x = arc4random() % salesAry.count;
    [self.listMuAry2 addObject:salesAry[x]];
    
    x = arc4random() % salesAry.count;
    [self.listMuAry3 addObject:salesAry[x]];
    
    x = arc4random() % salesAry.count;
    [self.listMuAry4 addObject:salesAry[x]];
    
    
    [self.columnData addObject:[NSString stringWithFormat:@"%ld日",self.listMuAry1.count]];
    
}
- (void)historyChart:(HistoryChart *)historyChart didSelectIndex:(NSInteger)index
{
    NSLog(@"点击了第 %ld",index);
}
- (void)updateViewWidth:(CGFloat)width
{
    if (self.myScrollView.contentSize.width != width) {
        self.myScrollView.contentSize = CGSizeMake(width, 400);
        CGRect rect = _hChartView.frame;
        rect.size.width = width;
        _hChartView.frame = rect;
    }
}

- (void)addClick
{
    [self addARecord];
    [_hChartView reloadData];
}
#define SLScreenHeight [UIScreen mainScreen].bounds.size.height

#define SLScreenWidth [UIScreen mainScreen].bounds.size.width
- (UIButton *)addButton
{
    if (_addButton) {
        return _addButton;
    }
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addButton.frame = CGRectMake((SLScreenWidth-100)*0.5, SLScreenHeight-44-80, 100, 44);
    [_addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    _addButton.backgroundColor = UIColor.orangeColor;
    [_addButton setTitle:@"增加一条" forState:UIControlStateNormal];
    return _addButton;
}
@end
