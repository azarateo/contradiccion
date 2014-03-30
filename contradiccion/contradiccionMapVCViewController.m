//
//  contradiccionMapVCViewController.m
//  contradiccion
//
//  Created by azarateo on 29/03/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "contradiccionMapVCViewController.h"
#define COLOMBIA_LAT 5;
#define COLOMBIA_LONG -72;
#define THESPAN 0.1f;


@interface contradiccionMapVCViewController ()

@end

@implementation contradiccionMapVCViewController

@synthesize mapa;


- (void)viewDidLoad
{
    [super viewDidLoad];
    mapa.showsUserLocation = YES;
    // Do any additional setup after loading the view.
    
    MKCoordinateRegion region;
    
    CLLocationCoordinate2D centro;
    
    centro.latitude = COLOMBIA_LAT;
    centro.longitude = COLOMBIA_LONG;
    
    [self findCurrentLocation];
    centro = ubicacionActual;
    
    MKCoordinateSpan elspan;
    elspan.latitudeDelta = THESPAN;
    elspan.longitudeDelta = THESPAN;
    
    region.center = centro;
    region.span = elspan;
    
    [mapa setRegion:region animated:YES];
    
    
    
    
    /*
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURL *url = [NSURL URLWithString:@"http://servicedatosabiertoscolombia.cloudapp.net/v1/Ministerio_de_Justicia/ubicacionprogramas?$format=json&"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];*/
    
}

/*
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Conexión con servidor realizada");
    datos = [[NSMutableData alloc] init];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    NSLog(@"descargando datos...");
    
    
    
    [datos appendData:data];
}

 
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
 
    NSString *datosPuros = [[NSString alloc] initWithData:datos encoding:NSUTF8StringEncoding];
    //NSLog(@"Datos sin modificar: %@", datosPuros);
    NSString *datosmejorados = [datosPuros substringFromIndex:5];
    long numerodedatos = datosmejorados.length-1;
    NSString *datosfinales = [datosmejorados substringToIndex:numerodedatos];
    //NSLog(@"Datos modificados: %@", datosfinales);
    NSLog(@"Codificación de datos a UTF8");
    NSData *losdatos = [datosfinales dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"Finaliza codifcaci");
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    arregloDatos = [NSJSONSerialization JSONObjectWithData:losdatos options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:nil];
 
     
    //Insertar marcadores y descripciones
    
    
    
}*/


-(void)findCurrentLocation
{
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled])
    {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        [locationManager startUpdatingLocation];
    }
    
    
    CLLocation *location = [locationManager location];
    ubicacionActual = [location coordinate];
    
    NSString *str=[[NSString alloc] initWithFormat:@" latitude:%f longitude:%f",ubicacionActual.latitude,ubicacionActual.longitude];
    NSLog(@"%@",str);
    
    
}

/*
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"Error en la descarga");
    UIAlertView *vistaError = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error en la descarga" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
    [vistaError show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    
}
 
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
