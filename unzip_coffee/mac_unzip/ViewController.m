//
//  ViewController.m
//  mac_unzip
//
//  Created by ZhangHonglin on 2017/8/18.
//  Copyright © 2017年 ChengDao. All rights reserved.
//

#import "ViewController.h"
#import <SSZipArchive/SSZipArchive.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet NSTextField *textField;
@property (nonatomic, weak) IBOutlet NSTextField *passwordField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clickAction:(id)sender {
    NSString *path = self.textField.stringValue;
    NSString *unzipPassword_Key = self.passwordField.stringValue;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return;
    }
    if (![path containsString:@".zip"]) {
        NSLog(@"无zip文件");
        return;
    }
    
    if (!unzipPassword_Key || unzipPassword_Key == 0) {
        NSLog(@"请输入密码");
        return;
    }
    
    NSString *zipName = [path componentsSeparatedByString:@"/"].lastObject;
    NSString *newPath = [path stringByReplacingOccurrencesOfString:zipName withString:@"unzipFile"];
    
    [SSZipArchive unzipFileAtPath:path toDestination:newPath overwrite:YES password:unzipPassword_Key progressHandler:^(NSString *entry, unz_file_info zipInfo, long entryNumber, long total) {
        
    } completionHandler:^(NSString *path, BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"解压成功");
        } else {
            NSLog(@"解压失败%@", error);
        }
    }];
    
}


@end
