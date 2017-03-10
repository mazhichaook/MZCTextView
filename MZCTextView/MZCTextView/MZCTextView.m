//
//  MZCTextView.m
//  MZCTextView
//
//  Created by Zhichao Ma on 2017/3/10.
//  Copyright © 2017年 Zhichao Ma. All rights reserved.
//

#import "MZCTextView.h"

@interface MZCTextView ()

// 占位符承载器
@property (nonatomic, weak) UILabel *placeholerLabel;

@end

@implementation MZCTextView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UILabel *placeholderL = [[UILabel alloc]init];
        
        placeholderL.backgroundColor = [UIColor clearColor];
        
        placeholderL.numberOfLines = 0;
        
        self.placeholerLabel = placeholderL;
        
        [self addSubview:self.placeholerLabel];
        
        // 设置默认占位符颜色
        self.placeHolderColor = [UIColor lightGrayColor];
        
        // 设置默认占位符以及文字大小
        self.font = [UIFont systemFontOfSize:15];
        
        self.placeholerLabel.textColor = self.placeHolderColor;
        
        self.placeholerLabel.font = [UIFont systemFontOfSize:15];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChanged) name:UITextViewTextDidChangeNotification object:self];
    }
    
    return self;
}

// 文字发生变化调用
-(void)textDidChanged {
    // hasText 是一个不常用的属性，当UITextView 输入了文字，hasText为YES，反之NO
    self.placeholerLabel.hidden = self.hasText;
}

// 属性设置
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    
    self.placeholerLabel.text = placeholder;
    
    // 重新计算子控件Frame
    [self setNeedsLayout];
}

-(void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    _placeHolderColor = placeHolderColor;
    
    self.placeholerLabel.textColor = placeHolderColor;
}
// 重写font的set方法，保持font一致
-(void)setFont:(UIFont *)font{
    [super setFont:font];
    
    self.placeholerLabel.font = font;
    
    // 文字大小发生变化，导致Placeholder的大小发生变化，需要重新计算控件的frame
    [self setNeedsLayout];
}

// 重写setText以及setAttributedText方法，因为UItextView 的文字不一定是手动输入的，来控制占位符的显示与隐藏
// 可能会有其他设置文字的方法，希望有知道的可以提出意见
-(void)setText:(NSString *)text{
    [super setText:text];
    
    [self textDidChanged];
}
-(void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    
    [self textDidChanged];
}
// 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat x = 5;
    CGFloat y = 8;
    CGFloat width = self.bounds.size.width;
    
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    CGFloat height = [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.placeholerLabel.font} context:nil].size.height;
    
    self.placeholerLabel.frame = CGRectMake(x, y, width, height);
}

// 销毁通知
-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextViewTextDidChangeNotification object:self];
    
}
@end
