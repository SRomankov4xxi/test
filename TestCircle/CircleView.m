//
//  CircleView.m
//  TestCircle
//
//  Created by Сергей Романков on 03.04.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "CircleView.h"
#import "CircleLayout.h"
#import "CircleModel.h"

static CGFloat lineCircleWidth = 10;
static CGFloat centerX = 0.f;
static CGFloat centerY = 0.f;
static CGFloat radius = 100.f;
static CGFloat maxValue = 270.f;

#define DEGREES_TO_RADIANS(degrees) (degrees) / 180.0 * M_PI


@implementation CircleView{
    NSArray* _arrData;

    
}


- (instancetype)initWithValue:(NSArray*)arrValue arrText:(NSArray*)arrText arrColor:(NSArray*)arrColor
{
    self = [super init];
    if (self) {
        [self calculateData];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    _arrData = [self mockData];
    [self calculateData];

    for(int i = 0; i < _arrData.count; i++){
        CircleModel* model = _arrData[i];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(centerX + 10, centerY- radius - lineCircleWidth + lineCircleWidth * i*2.4, 10, 10)];
        label.text = [NSString stringWithFormat:@"%@",model.title];
        label.textColor = [UIColor whiteColor];
        [label sizeToFit];
        [self addSubview:label];

        
        //
        CircleLayout* layout = [[CircleLayout alloc] initWithColor:model.color lineWidth:lineCircleWidth];
        layout.path = [self getBezierPathWithIndex:i*25 value:model.value.floatValue].CGPath;
        [self.layer insertSublayer:layout above:self.layer];
        
        NSLog(@"%@",model.value);
    }
}


-(UIBezierPath*)getBezierPathWithIndex:(int)index value:(CGFloat) value{
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(centerX-index/radius, centerY) radius:radius - index startAngle:DEGREES_TO_RADIANS(value) endAngle:DEGREES_TO_RADIANS(maxValue) clockwise:YES];
    return path;
}


-(void)calculateData{
    [self sortData];
    
    for(CircleModel* model in _arrData){
        CGFloat value = model.value.floatValue;
        CGFloat valueNew = fmodf(value, maxValue);
        valueNew = (valueNew != 0) ? maxValue - valueNew : valueNew;
        model.value = @(valueNew);
    }
}


-(void)sortData{
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"value"
                                                 ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [_arrData sortedArrayUsingDescriptors:sortDescriptors];
    
    _arrData = sortedArray;
}


-(NSArray*)mockData{
    CircleModel* model1 = [CircleModel new];
    model1.value = @270;
    model1.title = @"@230";
    model1.color = [UIColor greenColor];
    
    CircleModel* model2 = [CircleModel new];
    model2.value = @100;
    model2.title = @"@100";
    model2.color = [UIColor orangeColor];
    
    CircleModel* model3 = [CircleModel new];
    model3.value = @50;
    model3.title = @"@50";
    model3.color = [UIColor redColor];
    
    CircleModel* model4 = [CircleModel new];
    model4.value = @150;
    model4.title = @"@150";
    model4.color = [UIColor yellowColor];
    
    return @[model1, model2, model3];
}




@end
