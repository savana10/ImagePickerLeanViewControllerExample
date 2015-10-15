//
//  TakeImage.m
//  ImagePickerLeanVC
//
//  Created by Savana on 07/03/2015.
//  Copyright (c) 2015 Savana. All rights reserved.
//

#import "TakeImage.h"

@implementation TakeImage

UIImagePickerController *imagePicker;
- (void)showImagePicker:(UIButton *)sender
{
    UIAlertController *imageOptions=[UIAlertController alertControllerWithTitle:@"Upload picture" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *camera=[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self displayImage:true];
    }];
    UIAlertAction *image=[UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self displayImage:false];
    }];
    
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [imageOptions dismissViewControllerAnimated:true completion:nil];
    }];
    [imageOptions addAction:camera];
    [imageOptions addAction:image];
    [imageOptions addAction:cancel];
    [self.displayController presentViewController:imageOptions animated:true completion:nil];
    
}
-(void) displayImage:(BOOL )camera
{
    imagePicker=[[UIImagePickerController alloc] init];
    if(camera && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        if(self.frontCamera && [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]){
            [imagePicker setCameraDevice:UIImagePickerControllerCameraDeviceFront];
        }else{
            [imagePicker setCameraDevice:UIImagePickerControllerCameraDeviceRear];
        }
    }else{
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [imagePicker setDelegate:self];
    [self.displayController presentViewController:imagePicker animated:true completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    @autoreleasepool {

    UIImage *originalImage=[info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageViewToBeDisplayed setImage:originalImage];
    
    
    [self.displayController dismissViewControllerAnimated:true completion:^{
        if ([self.delegate respondsToSelector:@selector(imageCaptured:)]) {
    [self.delegate imageCaptured:[NSMutableData dataWithData:UIImageJPEGRepresentation(originalImage, 1.0f)]];
        }

    }];
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if ([self.delegate respondsToSelector:@selector(userCancelled)]) {
    [self.delegate userCancelled];        
    }

    [self.displayController dismissViewControllerAnimated:true completion:nil];
}
@end
