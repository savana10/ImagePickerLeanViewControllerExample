//
//  ImageDelegeVC.m
//  ImagePickerLeanVC
//
//  Created by Savana on 15/10/2015.
//  Copyright © 2015 Savana. All rights reserved.
//

#import "ImageDelegeVC.h"
#import "TakeImage.h"

@interface ImageDelegeVC ()<TakeImageDelegate>

@end

@implementation ImageDelegeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma Mark- TakeImageDelegate
- (void)userCancelled
{
    NSLog(@"user cancelled");
}
- (void)imageCaptured:(NSMutableData *)imageData
{
    NSLog(@"Number of bytes size %li",imageData.length);
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
