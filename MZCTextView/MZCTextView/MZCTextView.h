//
//  MZCTextView.h
//  MZCTextView
//
//  Created by Zhichao Ma on 2017/3/10.
//  Copyright © 2017年 Zhichao Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZCTextView : UITextView

// 占位符
@property (nonatomic, copy) NSString *placeholder;
// 文字颜色
@property (nonatomic, strong) UIColor *placeHolderColor;

@end
