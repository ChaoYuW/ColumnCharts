//
//  ViewController.m
//  LineChart
//
//  Created by chao on 2021/4/26.
//

#import "ViewController.h"
#import "LineChartViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.orangeColor;
}

- (IBAction)gotoClick:(UIButton *)sender {
    LineChartViewController *vc = LineChartViewController.new;
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end
