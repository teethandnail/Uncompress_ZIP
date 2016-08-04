//
//  ViewController.m
//  unzip_coffee
//
//  Created by ZhangHonglin on 16/8/4.
//  Copyright © 2016年 ChengDao. All rights reserved.
//

#import "ViewController.h"
#import <SSZipArchive/SSZipArchive.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *unzipBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:unzipBtn];
    
    [unzipBtn setTitle:@"解压数据库" forState:UIControlStateNormal];
    [unzipBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [unzipBtn addTarget:self action:@selector(unzipAction:) forControlEvents:UIControlEventAllTouchEvents];
}

- (void)unzipAction:(id)sender {
    NSString *unzipPassword_Key = @"123456";
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"xpay.zip"];
    NSString *destination = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"unzipFile"];
    
    [SSZipArchive unzipFileAtPath:filePath toDestination:destination overwrite:YES password:unzipPassword_Key progressHandler:^(NSString *entry, unz_file_info zipInfo, long entryNumber, long total) {
        
    } completionHandler:^(NSString *path, BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"解压成功");
        } else {
            NSLog(@"解压失败%@", error);
        }
    }];
    
}

@end
