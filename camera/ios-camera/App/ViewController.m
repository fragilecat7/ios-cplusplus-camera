//
//  ViewController.m
//  ios-camera
//
//  Created by phornsby on 2/15/20.
//  Copyright © 2020 phornsby. All rights reserved.
//

#import "ViewController.h"
#import "CameraViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CameraViewController *cameraViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.cameraViewController = [[CameraViewController alloc] init];
    [self showViewController:self.cameraViewController sender:self];
    
}

@end
