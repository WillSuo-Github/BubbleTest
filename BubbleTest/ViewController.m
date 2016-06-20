//
//  ViewController.m
//  BubbleTest
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Pop.h"
#import "Hello.framework/Headers/centTool.h"




@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.btn.layer.cornerRadius = self.btn.bounds.size.width / 2;
    self.btn.layer.masksToBounds = YES;
    [centTool sayHello];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnChick:(UIButton *)sender {
    UIImageView *bubbleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_guanzhuaixin"]];
//    bubbleView.bounds = CGRectMake(sender.center.x, sender.center.y, 30, 30);
    
    [self.view addSubview:bubbleView];
    POPBasicAnimation *ani = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    ani.duration = 5;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    ani.fromValue = [NSValue valueWithCGPoint:sender.center];
    ani.toValue = [NSValue valueWithCGPoint:CGPointMake(sender.center.x, 20)];
    
    
    int tmpRange = 100;
    int x = (arc4random() % tmpRange) + sender.center.x - tmpRange/2;
    NSLog(@"%d",x);
    POPBasicAnimation *levelAni = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    levelAni.duration = 5;
    levelAni.toValue = [NSValue valueWithCGPoint:CGPointMake(x, 20)];
    
    
    POPBasicAnimation *alphAni = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphAni.duration = 5;
    alphAni.fromValue = @(1);
    alphAni.toValue = @(0.2);
    [alphAni setCompletionBlock:^(POPAnimation *ani, BOOL isEnd) {
        if (isEnd) {
            [bubbleView removeFromSuperview];
        }
    }];

    
    [bubbleView pop_addAnimation:ani forKey:@"sheng"];
    [bubbleView pop_addAnimation:alphAni forKey:@"alph"];
    [bubbleView pop_addAnimation:levelAni forKey:@"levelAni"];
    
}

@end
