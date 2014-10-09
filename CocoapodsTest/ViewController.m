//
//  ViewController.m
//  CocoapodsTest
//
//  Created by Ben Norris on 10/8/14.
//  Copyright (c) 2014 BSN Design. All rights reserved.
//

#import "ViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Button Touched");
    [SVProgressHUD show];
    [self performSelector:@selector(dismissHUD) withObject:nil afterDelay:3];
}

- (void)dismissHUD {
    [SVProgressHUD dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
