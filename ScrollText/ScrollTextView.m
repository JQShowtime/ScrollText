//
//  ScrollTextView.m
//  ScrollText
//
//  Created by roboca on 15/10/22.
//  Copyright © 2015年 roboca. All rights reserved.
//

#import "ScrollTextView.h"

@interface ScrollTextView ()

@property(strong, nonatomic) UILabel *anotherLabel;
@property(strong, nonatomic) NSTimer *scrollTimer;

@end

@implementation ScrollTextView
@synthesize textLabel;
@synthesize scrollSpeed;
@synthesize textMargin;
@synthesize anotherLabel;
@synthesize scrollTimer;

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        textLabel = [[UILabel alloc] initWithFrame:frame];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:textLabel];
    }
    return self;
}

-(void)setSpeed:(NSInteger)speed{
    self.scrollSpeed = (100-speed)/1000.0;
    scrollTimer = [NSTimer scheduledTimerWithTimeInterval:self.scrollSpeed target:self selector:@selector(scrollLabel) userInfo:nil repeats:YES];
    [scrollTimer fire];
}

-(void)scrollLabel{
    if (!anotherLabel) {
        textLabel.frame = CGRectMake(textLabel.frame.origin.x-2, textLabel.frame.origin.y, textLabel.frame.size.width, textLabel.frame.size.height);
        if (textLabel.frame.origin.x+textLabel.frame.size.width < 0) {
            textLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, textLabel.frame.origin.y, textLabel.frame.size.width, textLabel.frame.size.height);
        }
    }
    else{
        textLabel.frame = CGRectMake(textLabel.frame.origin.x-2, textLabel.frame.origin.y, textLabel.frame.size.width, textLabel.frame.size.height);
        anotherLabel.frame = CGRectMake(anotherLabel.frame.origin.x-2, anotherLabel.frame.origin.y, anotherLabel.frame.size.width, anotherLabel.frame.size.height);
        if (textLabel.frame.origin.x+textLabel.frame.size.width < 0) {
            textLabel.frame = CGRectMake(anotherLabel.frame.origin.x+anotherLabel.frame.size.width+textMargin, textLabel.frame.origin.y, textLabel.frame.size.width, textLabel.frame.size.height);
        }
        if (anotherLabel.frame.origin.x+anotherLabel.frame.size.width < 0) {
            anotherLabel.frame = CGRectMake(textLabel.frame.origin.x+textLabel.frame.size.width+textMargin, anotherLabel.frame.origin.y, anotherLabel.frame.size.width, anotherLabel.frame.size.height);
        }
    }
}

-(void)setStartPosition:(NSInteger)startPoint{
    textLabel.frame = CGRectMake(startPoint, 0, 0, 0);
}

-(void)setText:(NSString *)text{
    textLabel.text = text;
    CGSize textSize = [textLabel sizeThatFits:CGSizeMake(5000, self.frame.size.height)];
    CGRect frame = textLabel.frame;
    frame.size = textSize;
    textLabel.frame = frame;
}

-(void)setMargin:(NSInteger)margin{
    textMargin = margin;
    if (textLabel.frame.size.width > [UIScreen mainScreen].bounds.size.width) {
        anotherLabel = [[UILabel alloc] initWithFrame:CGRectMake(textLabel.frame.size.width+textLabel.frame.origin.x+textMargin, textLabel.frame.origin.y, textLabel.frame.size.width, textLabel.frame.size.height)];
        anotherLabel.text = textLabel.text;
        anotherLabel.backgroundColor = [UIColor clearColor];
        anotherLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:anotherLabel];
    }
}

@end
