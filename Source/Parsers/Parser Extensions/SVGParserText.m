//
//  SVGParserText.m
//  SVGKit-iOS
//
//  Created by Michael Frain on 5/5/15.
//  Copyright (c) 2015 na. All rights reserved.
//

#import "SVGParserText.h"
#import "SVGTextElement.h"
#import "SVGElement_ForParser.h"
#import "SVGTspanElement.h"
#import "Text.h"
#import "Element.h"

@implementation SVGParserText

static NSSet *svgParserTextSupportedNamespaces = nil;
-(NSSet *) supportedNamespaces
{
    if( svgParserTextSupportedNamespaces == nil )
        svgParserTextSupportedNamespaces = [[NSSet alloc] initWithObjects:
                                               @"http://www.w3.org/2000/svg",
                                               nil];
    return svgParserTextSupportedNamespaces;
}

static NSSet *svgParserTextSupportedTags = nil;
-(NSSet *)supportedTags
{
    if( svgParserTextSupportedTags == nil )
        svgParserTextSupportedTags = [[NSSet alloc] initWithObjects:@"text", @"tspan", nil];
    return svgParserTextSupportedTags;
}

- (Node *)handleStartElement:(NSString *)name document:(SVGKSource *)document namePrefix:(NSString *)prefix namespaceURI:(NSString *)XMLNSURI attributes:(NSMutableDictionary *)attributes parseResult:(SVGKParseResult *)parseResult parentNode:(Node *)parentNode {
    if( [[self supportedNamespaces] containsObject:XMLNSURI] )
    {
        if( [name isEqualToString:@"text"])
        {
            SVGTextElement *element = [[[SVGTextElement alloc] initWithQualifiedName:name inNameSpaceURI:XMLNSURI attributes:attributes] autorelease];
            
            [element postProcessAttributesAddingErrorsTo:parseResult];
            
            return element;
        }
        else if ([name isEqualToString:@"tspan"])
        {
            SVGTspanElement *element = [[[SVGTspanElement alloc] initWithQualifiedName:name inNameSpaceURI:XMLNSURI attributes:attributes] autorelease];
            
            [element postProcessAttributesAddingErrorsTo:parseResult];
            
            return element;
        }
    }
    
    return nil;
}

- (void)handleEndElement:(Node *)newNode document:(SVGKSource *)document parseResult:(SVGKParseResult *)parseResult {
    
}

@end
