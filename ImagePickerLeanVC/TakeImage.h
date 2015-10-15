//
//  TakeImage.h
//  ImagePickerLeanVC
//
//  Created by Savana on 07/03/2015.
//  Copyright (c) 2015 Savana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//! TakeImageDelegate to handle image selection and cancelled
@protocol TakeImageDelegate <NSObject>
/**
 *  Once a user selects an image or captures an image this method is called
 *
 *  @param imageData NSMutableData of the image selected by the user
 */
-(void) imageCaptured:(NSMutableData *)imageData;
//! Once a User canels image selection then this method is called.
-(void) userCancelled;

@end

@interface TakeImage : NSObject <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
//!TakeImage delegate
@property (strong,nonatomic) IBOutlet id<TakeImageDelegate> delegate;

//! If by default front camera of the device needs to be accessed
@property BOOL frontCamera;
//! UIVIewController where the UIImagePickerController needs to be displayed
@property (strong,nonatomic) IBOutlet UIViewController *displayController;
//! UIImageView where the selected image needs to be displayed
@property (strong,nonatomic) IBOutlet UIImageView      *imageViewToBeDisplayed;
//! IBAction to perform Image selection
-(IBAction) showImagePicker:(UIButton *)sender;




@end
