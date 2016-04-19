//
//  CircleLayout.m
//  TestCircle
//
//  Created by Сергей Романков on 03.04.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "CircleLayout.h"



@implementation CircleLayout{
    UIColor* _color;
}


-(id)initWithColor:(UIColor*)color lineWidth:(CGFloat)lineWidth{
    self = [super init];
    if (self) {
        _color = color;
        self.strokeColor   = [color CGColor];
        self.lineWidth     = lineWidth;
        self.lineCap       = kCALineCapRound;
        self.lineJoin      = kCALineJoinBevel;
        self.fillColor     = [[UIColor clearColor]CGColor];
    }
    return self;}



@end
