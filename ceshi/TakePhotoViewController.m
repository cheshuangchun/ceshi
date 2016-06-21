//
//  TakePhotoViewController.m
//  ceshi
//
//  Created by csc on 16/4/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "TakePhotoViewController.h"

@interface TakePhotoViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIButton * takePhoto;
    
    UIImageView * beforeImage;
    UIImageView * afterImage;
}
@end

@implementation TakePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    takePhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [takePhoto setTitle:@"拍照" forState:UIControlStateNormal];
    takePhoto.frame = CGRectMake(10, 20, 100, 30);
    [takePhoto addTarget:self action:@selector(takePhotoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:takePhoto];
    
    beforeImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 60, 375, 250)];
    [self.view addSubview:beforeImage];
    beforeImage.backgroundColor = [UIColor yellowColor];
    
    
    afterImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300, 375, 250)];
    [self.view addSubview:afterImage];
    afterImage.backgroundColor = [UIColor orangeColor];

    
    
}


-(void)takePhotoClick:(UIButton *)btn
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    NSArray *temp_MediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    picker.mediaTypes = temp_MediaTypes;
    picker.delegate = self;
    //picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
    }];
}

- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}



#pragma mark -------------取消相册---------- UIImagePickerControllerDelegate----
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

//获取选择的UIImage对象
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"imagePickerController ...... =%@", info);
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *camImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    NSData * camData = UIImagePNGRepresentation(camImage);
    
    
    [beforeImage setImage:camImage];
    
    UIImage * afterIma = [[UIImage alloc]init];
    
    
    if(camImage){
        
        
        CGFloat size=300.f;// kb
        CGFloat scale=size/(camData.length/1024);
        NSData *newData=UIImageJPEGRepresentation(camImage, scale);
        
        NSData * afterData = UIImagePNGRepresentation(afterIma);
        
        afterIma = [UIImage imageWithData:newData];
        
        [afterImage setImage:afterIma];
        //[XYNetPhotoUploadManager shareManager].uploadPicArr = _fPhotosArray;
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
