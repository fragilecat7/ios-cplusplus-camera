//
//  CameraViewController.m
//  ios-camera
//
//  Created by phornsby on 2/15/20.
//  Copyright © 2020 phornsby. All rights reserved.
//

#import "CameraViewController.h"
#import "AudioVideoCaptureSession.h"

@interface CameraViewController ()

@property(atomic, strong) AudioVideoCaptureSession *captureSession;


@end

@implementation CameraViewController

// MARK: - Lifecycle
- (instancetype)init
{
    self = [self initWithNibName:nil bundle:nil];
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor orangeColor];
    self.captureSession = [[AudioVideoCaptureSession alloc] init];
    
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.captureSession prepareToCapture];
    AVCaptureVideoPreviewLayer *layer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
    layer.frame = [UIScreen mainScreen].bounds;
    layer.position = self.view.center;
    layer.videoGravity = AVLayerVideoGravityResize;
    [self.view.layer addSublayer:layer];
    [self.captureSession startRunning];

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
