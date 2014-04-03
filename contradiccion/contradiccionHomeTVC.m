//
//  contradiccionHomeTVC.m
//  contradiccion
//
//  Created by azarateo on 29/03/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "contradiccionHomeTVC.h"


#pragma mark - Configuracion de constantes

#define URL_DE_DESCARGA @"http://servicedatosabiertoscolombia.cloudapp.net/v1/Ministerio_de_Justicia/tabladrogas?$format=json&"//Url para la descarga del JSON
#define VARIABLE_DE_DATOS_EN_JSON @"d"//Variable que contiene el arreglo que se mostrará en la tabla
#define IDENTIFICADOR_DE_CELDA @"elementoHome"//Cadena para identificar el tipo de celda
#define ELEMENTO_ARREGLO_PARA_TITULO @"nombre_de_la_droga"//Nombre de la llave que tiene los datos de título
#define ELEMENTO_ARREGLO_PARA_SUBTITULO @"clasificacion"//Nombre de la llave que tiene los datos del subtítulo

@implementation contradiccionHomeTVC

#pragma mark - Conneccion y descarga de datos

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;//Indica al usuario que los datos estan cargando
    
    //Creación de la conexión para la descarga de datos
    NSURL *url = [NSURL URLWithString:URL_DE_DESCARGA];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    coneccion = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Se recibió respuesta del servidor");
    datos = [[NSMutableData alloc] init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //NSLog(@"descargando datos...");
        [datos appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Terminó la carga de datos");
    NSDictionary *diccionarioInicial = [NSJSONSerialization JSONObjectWithData:datos options: 0 error:NULL];
    NSArray *arregloDelDiccionariodeDatos = [diccionarioInicial valueForKeyPath:VARIABLE_DE_DATOS_EN_JSON];
    NSLog(@"Datos del arreglo de a partir del diccionario %@",arregloDelDiccionariodeDatos);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    arregloDatos = [NSMutableArray arrayWithArray:arregloDelDiccionariodeDatos];
    [tablaDatos reloadData];
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Falló la conexión");
    UIAlertView *vistaError = [[UIAlertView alloc] initWithTitle:@"Error de conexión" message:@"Error en la descarga de datos" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
    [vistaError show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
     NSLog(@"Alerta de memoria");
}

#pragma mark - Configuración de datos para la tabla

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arregloDatos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:IDENTIFICADOR_DE_CELDA forIndexPath:indexPath];
   //[[arregloDatos objectAtIndex:indexPath.row] objectForKey:@"d"];
    cell.textLabel.text = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:ELEMENTO_ARREGLO_PARA_TITULO];
    cell.detailTextLabel.text = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:ELEMENTO_ARREGLO_PARA_SUBTITULO];
   
    return cell;
}

#pragma mark - Navegacion al detalle después de seleccionar la fila


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}




/*
-(void)filterContentForSearchText:(NSString *)searchText forScope:(NSString *)scope{

    NSPredicate *predicado = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@",searchText];
    [arregloDatos filteredArrayUsingPredicate:predicado];

}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{

    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;

}*/


@end
