//
//  ScrollTextView.h
//  ScrollText
//
//  Created by roboca on 15/10/22.
//  Copyright © 2015年 roboca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollTextView : UIView

@property(strong, nonatomic) UILabel *textLabel;
@property(assign, nonatomic) CGFloat scrollSpeed;
@property(assign, nonatomic) NSInteger textMargin;

-(void)setStartPosition:(NSInteger) startPoint;
-(void)setText:(NSString *)text;
-(void)setSpeed:(NSInteger)speed;
-(void)setMargin:(NSInteger)margin;

@end
