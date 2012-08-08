//
//  GraphViewController.h
//  Calculator
//
//  Created by Redkovich Roman on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"
#import "CalculatorBrain.h"

@interface GraphViewController : UIViewController <PointsToDraw>
@property (nonatomic, strong) id program;
@end
