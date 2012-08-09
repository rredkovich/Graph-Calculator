//
//  GraphViewController.m
//  Calculator
//
//  Created by Redkovich Roman on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GraphViewController.h"

@interface GraphViewController ()
@property (nonatomic, weak) IBOutlet GraphView *graphView;

@end

@implementation GraphViewController
@synthesize graphView = _graphView;
@synthesize program = _program;

- (void) setGraphView:(GraphView *)graphView {
    _graphView = graphView;
    self.graphView.dataSource = self;
    
    [self.graphView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self.graphView action:@selector(pan:)]];
    
    [self.graphView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.graphView action:@selector(pinch:)]];
}

- (void) setProgram:(id)program {
    _program = program;
   
    [self.graphView setNeedsDisplay];
}

- (NSArray *)graphSource:(GraphView *)sender inBoundsFrom:(CGFloat)beginnig to:(CGFloat)end {
    NSMutableArray *graphSource = [[NSMutableArray alloc] init];
    if (beginnig > end) return graphSource;
    
    NSNumber *startValue = [[NSNumber alloc] initWithInt:beginnig];
    NSNumber *currentValue = startValue;
    NSNumber *endValue = [[NSNumber alloc] initWithInt:end];
    
  
    while (![currentValue isEqualToNumber:endValue]) {
        NSDictionary *variable = [NSDictionary dictionaryWithObjectsAndKeys:currentValue, @"x", nil];
        NSNumber *yForX = [[NSNumber alloc] initWithFloat:[CalculatorBrain runProgram:self.program usingVariableValues:variable]];
        
        [graphSource addObject:currentValue];
        [graphSource addObject:yForX];
        
        currentValue = [NSNumber numberWithInt:([currentValue intValue] + 1)];         
    }
    
    return graphSource;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
