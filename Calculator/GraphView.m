//
//  AxesDrawerView.m
//  sandbox
//
//  Created by Redkovich Roman on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GraphView.h"

@interface GraphView ()
//тестовые значения для метода drawAxesInRect
@property (nonatomic) CGRect bounds;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGFloat scale;
@end

@implementation GraphView
@synthesize bounds = _bounds;
@synthesize origin = _origin;
@synthesize scale = _scale;
@synthesize dataSource = _dataSource;

 
-(CGRect) bounds {
    _bounds.origin.x = 1;
    _bounds.origin.y = 1;
    _bounds.size.width = 320;
    _bounds.size.height = 460;
    return  _bounds;
}

//жест pan изменяет координаты origin
-(CGPoint) origin {
    _origin.x = 1;
    _origin.y = 1;
    return _origin;
}

//жест pinch изменяет значение scale
-(CGFloat) scale {
    return _scale = 1;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
 }
    return self;
}

- (void)setup
{
    self.contentMode = UIViewContentModeRedraw; // if our bounds changes, redraw ourselves
}

- (void)awakeFromNib
{
    [self setup]; // get initialized when we come out of a storyboard
}

- (void)drawRect:(CGRect)rect
{
    [AxesDrawer drawAxesInRect:self.bounds originAtPoint:self.origin scale:self.scale];
  /*CGPoint point = [self.dataSource drawThisPoint:self];
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, point.x, point.y, 2, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    UIGraphicsPopContext();    
    */
}

@end
