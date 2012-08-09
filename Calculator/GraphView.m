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
@end

@implementation GraphView
@synthesize bounds = _bounds;
@synthesize origin = _origin;
@synthesize scale = _scale;
@synthesize dataSource = _dataSource;

 
-(CGRect) bounds {
    _bounds.origin.x = 0;
    _bounds.origin.y = 0;
    _bounds.size.width = 320;
    _bounds.size.height = 460;
    return  _bounds;
}

- (void) setOrigin:(CGPoint)origin {
    if ((origin.x != _origin.x) || (origin.y != _origin.y)) {
        _origin = origin;
        [self setNeedsDisplay];
    }
}

-(void) setScale:(CGFloat)scale {
    if (_scale != scale) {
        _scale = scale;
        [self setNeedsDisplay];
    }
    if (!_scale) {
        _scale = 1;
    }
}

- (CGFloat) getScale {
    if (!_scale) _scale = 1;
    return _scale;
}

- (void) pan: (UIPanGestureRecognizer *)gesture {
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint fingerPoint = [gesture translationInView:self];
        fingerPoint.x += self.origin.x;
        fingerPoint.y += self.origin.y;
        self.origin = fingerPoint;
        [gesture setTranslation:CGPointZero inView:self];
    }
}

- (void)pinch:(UIPinchGestureRecognizer *)gesture {
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        self.scale *= (gesture.scale);
        gesture.scale = 1;
    }
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
    
    NSArray *graphSource = [[NSArray alloc] initWithArray:[self.dataSource graphSource:self inBoundsFrom:(-self.origin.x) to:(self.origin.x + self.bounds.size.width)]];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);

    CGContextMoveToPoint(context, [[graphSource objectAtIndex:0] floatValue], [[graphSource objectAtIndex:1] floatValue]);
    
    for (int i = 0; i < [graphSource count]; i = i + 2) {
        
        CGFloat xPosition = self.origin.x + ([[graphSource objectAtIndex:i] floatValue] - [[graphSource objectAtIndex:i] floatValue] * self.scale);
        
        CGFloat yPosition = self.origin.y - ([[graphSource objectAtIndex:(i+1)] floatValue] - [[graphSource objectAtIndex:(i+1)] floatValue] * self.scale);
        
        CGContextAddLineToPoint(context, xPosition, yPosition);
    }
    
    CGContextStrokePath(context);
    
    UIGraphicsPopContext(); 

   
}

@end
