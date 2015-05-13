//
//  SVGTspanElement.m
//  SVGKit-iOS
//
//  Created by Michael Frain on 4/29/15.
//  Copyright (c) 2015 na. All rights reserved.
//

#import "SVGTspanElement.h"
#import "SVGTextPositioningElement_Mutable.h"

@implementation SVGTspanElement

@synthesize transform;

- (CALayer *)newLayer {
    CALayer *layer = [super newLayer];
    return layer;
}

- (void)layoutLayer:(CALayer *)layer {
    
}

+ (CALayer *)transformSpanElements:(CALayer *)rawLayer fromParentNode:(SVGTextElement *)parentNode {
    
}

@end
