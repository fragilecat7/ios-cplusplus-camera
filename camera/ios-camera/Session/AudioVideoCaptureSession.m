//
//  AudioVideoCaptureSession.m
//  ios-camera
//
//  Created by phornsby on 2/15/20.
//  Copyright © 2020 phornsby. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "AudioVideoCaptureSession.h"


@interface AudioVideoCaptureSession() <AVCaptureVideoDataOutputSampleBufferDelegate>

@property (nonnull, nonatomic, strong) AVCaptureDevice *device;
@property (nonatomic, strong) dispatch_queue_t bufferProcessingQueue;


//- (void)captureOutput:(AVCaptureOutput *)output
//didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
//       fromConnection:(AVCaptureConnection *)connection;


@end


@implementation AudioVideoCaptureSession


- (BOOL)prepareToCapture
{
    if (self.device) {
        return false;
    }
    
    
    NSArray *types = @[AVCaptureDeviceTypeBuiltInWideAngleCamera];
    if (@available(iOS 11.1, *)) {
        types = @[AVCaptureDeviceTypeBuiltInDualCamera, AVCaptureDeviceTypeBuiltInWideAngleCamera, AVCaptureDeviceTypeBuiltInTelephotoCamera, AVCaptureDeviceTypeBuiltInTrueDepthCamera];
    }
    
    
    if (@available(iOS 10.2, *)) {
        types = @[AVCaptureDeviceTypeBuiltInDualCamera, AVCaptureDeviceTypeBuiltInWideAngleCamera, AVCaptureDeviceTypeBuiltInTelephotoCamera];
    }

    
    AVCaptureDeviceDiscoverySession *discovery = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:types mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionUnspecified];

    for (AVCaptureDevice *device in discovery.devices) {
        if ([device isFocusModeSupported:AVCaptureFocusModeAutoFocus]
            || [device isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus]) {
            self.device = device;
            break;
        }
    }
    
    if (self.device == nil) {
        return false;
    }
    
    NSError *error = nil;
    AVCaptureDeviceInput *input = [[AVCaptureDeviceInput alloc] initWithDevice:self.device error:&error];
    if (input == nil || error != nil) {
        return false;
    }
    [self addInput:input];
    
    
    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
    output.alwaysDiscardsLateVideoFrames = true;
    NSNumber *bufferValue = [[NSNumber alloc] initWithInt:kCVPixelFormatType_32BGRA];
    output.videoSettings = @{ (NSString *)kCVPixelBufferPixelFormatTypeKey : bufferValue };
    
    if (output == nil) {
        return false;
    }
    [self addOutput:output];
    
    return true;
}


- (void)endCaptureSession
{
    
}


// MARK: -AVCaptureVideoDataOutputSampleBufferDelegate
- (void)captureOutput:(AVCaptureOutput *)output
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection
{
    NSLog(@"AVCaptureVideoDataOutputSampleBufferDelegate: called!! try processing something!!");
    
}


@end
