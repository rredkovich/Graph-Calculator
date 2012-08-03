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


- (CGPoint) calculateYforX:(int)x withProgram:(id)program {
    NSDictionary *variablesSet = [[NSDictionary alloc] init];    
    variablesSet = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:x], @"x", nil];
    CGPoint point;
    point.x = 12;
    point.y = [CalculatorBrain runProgram:program usingVariableValues:variablesSet];
    return point;
}

-  (CGPoint) drawThisPoint:(GraphView *)sender {
    return [self calculateYforX:x withProgram:<#(id)#>
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
