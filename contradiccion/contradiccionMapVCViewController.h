//
//  contradiccionMapVCViewController.h
//  contradiccion
//
//  Created by azarateo on 29/03/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface contradiccionMapVCViewController : UIViewController <CLLocationManagerDelegate>{

    NSMutableData *datos;
    NSMutableArray *arregloDatos;
    NSMutableArray *losdatosreales;
    MKMapView *mapview;
    CLLocationCoordinate2D ubicacionActual;

}

@property (weak, nonatomic) IBOutlet MKMapView *mapa;





@end
