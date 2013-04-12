//
//  CustomTypes.h
//  WingMan
//
//  Created by Johann Kriek on 13-04-10.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface restaurant : NSObject
{
    NSString *name;
    double lat;
    double lng;
}
@property(retain) NSString *name;
@property(assign) double lat;
@property(assign) double lng;
@end

@interface annotation : NSObject <MKAnnotation> {
    
	NSString *title;
	CLLocationCoordinate2D coordinate;
    
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d;

@end