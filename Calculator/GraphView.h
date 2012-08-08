//
//  AxesDrawerView.h
//  sandbox
//
//  Created by Redkovich Roman on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AxesDrawer.h"

@class GraphView;

@protocol PointsToDraw 
- (NSArray *)graphSource:(GraphView *)sender inBoundsFrom:(CGFloat)beginnig to:(CGFloat)end;
@end


@interface GraphView : UIView
@property (nonatomic, weak) IBOutlet id <PointsToDraw> dataSource;
@end

