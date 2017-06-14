//
//  ViewController.m
//  GPUImageDemo
//
//  Created by LiuLei on 2017/5/4.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ViewController.h"
#import <GPUImage/GPUImage.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation ViewController

//视觉效果
- (IBAction)btn1:(UIButton *)sender {
    
//    拉伸  伸展失真，哈哈镜
//    GPUImageStretchDistortionFilter *disFilter =[[GPUImageStretchDistortionFilter alloc] init];
//    disFilter.center = CGPointMake(0.5, 0.5);
    
//    局部拉伸 凸起失真，鱼眼效果
//    GPUImageBulgeDistortionFilter *disFilter = [[GPUImageBulgeDistortionFilter alloc] init];
    
//     收缩失真，凹面镜
//    GPUImagePinchDistortionFilter *disFilter = [[GPUImagePinchDistortionFilter alloc] init];
    
//    水晶球效果
//    GPUImageGlassSphereFilter *disFilter = [[GPUImageGlassSphereFilter alloc] init];
//    球形折射，图形倒立
//    GPUImageSphereRefractionFilter *disFilter = [[GPUImageSphereRefractionFilter alloc] init];
//    卡通效果（黑色粗线描边）
//    GPUImageToonFilter *disFilter = [[GPUImageToonFilter alloc] init];
    
    GPUImageVignetteFilter *disFilter = [[GPUImageVignetteFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:self.imgV.frame.size];
    
    //
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:self.imgV.image];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    //加载出来
    self.imgV.image = newImage;
    
}


- (IBAction)btn2:(id)sender {
    //亮度
    // Brightness ranges from -1.0 to 1.0, with 0.0 as the normal level
//    @property(readwrite, nonatomic) CGFloat brightness;
//    GPUImageBrightnessFilter *disFilter = [[GPUImageBrightnessFilter alloc] init];
//    曝光
//    GPUImageExposureFilter *disFilter = [[GPUImageExposureFilter alloc] init];
//    disFilter.exposure = 1;
    
//    对比度
//    GPUImageContrastFilter *disFilter = [[GPUImageContrastFilter alloc] init];
//    disFilter.contrast = 3;
    
//    GPUImageBrightnessFilter *disFilter = [[GPUImageBrightnessFilter alloc] init];
    
//    GPUImageBrightnessFilter *disFilter = [[GPUImageBrightnessFilter alloc] init];
    
//    GPUImageBrightnessFilter *disFilter = [[GPUImageBrightnessFilter alloc] init];
    
    GPUImageBrightnessFilter *disFilter = [[GPUImageBrightnessFilter alloc] init];
    disFilter.brightness = -0.5;
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:self.imgV.frame.size];
    //
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:self.imgV.image];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];

#warning TODO: 渲染图片属于耗时操作  是否需要放入子线程
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //开始渲染
        [stillImageSource processImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            //获取渲染后的图片
            UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
            //加载出来
            self.imgV.image = newImage;
        });
    });
}

- (IBAction)btn3:(id)sender {
    GPUImageBrightnessFilter *disFilter = [[GPUImageBrightnessFilter alloc] init];
    
    disFilter.brightness = -0.5f;
    
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:self.imgV.frame.size];
    //
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:self.imgV.image];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    //加载出来
    self.imgV.image = newImage;
}

- (IBAction)btn4:(id)sender {
}

- (IBAction)btn5:(id)sender {
}

- (IBAction)btn6:(id)sender {
}

- (IBAction)btn7:(id)sender {
}


- (IBAction)btn8:(id)sender {
}

- (IBAction)btn9:(id)sender {
}

- (IBAction)btn10:(id)sender {
}

- (IBAction)btn11:(id)sender {
}

- (IBAction)btn12:(id)sender {
}

- (IBAction)btn13:(id)sender {
}

- (IBAction)btn14:(id)sender {
}

- (IBAction)btnOriginal:(id)sender {
    
    self.imgV.image = [UIImage imageNamed:@"timg"];
    
}

- (IBAction)slider:(id)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
