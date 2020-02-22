//
//  AudioVideoCaptureSession.h
//  ios-camera
//
//  Created by phornsby on 2/15/20.
//  Copyright © 2020 phornsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AudioVideoCaptureSession : AVCaptureSession

- (BOOL)prepareToCapture;

- (void)endCaptureSession;


@end

NS_ASSUME_NONNULL_END
