//
//  contradiccionHomeTVC.m
//  contradiccion
//
//  Created by azarateo on 29/03/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "contradiccionHomeTVC.h"
#import "detalleContradiccionHome.h"


#pragma mark - Configuracion de constantes

#define URL_DE_DESCARGA @"http://servicedatosabiertoscolombia.cloudapp.net/v1/UNGRD/emergenciastotal?$format=json&"//Url para la descarga del JSON
#define VARIABLE_DE_DATOS_EN_JSON @"d"//Variable que contiene el arreglo que se mostrará en la tabla
#define IDENTIFICADOR_DE_CELDA @"elementoHome"//Cadena para identificar el tipo de celda
#define ELEMENTO_ARREGLO_PARA_TITULO @"evento"//Nombre de la llave que tiene los datos de título
#define ELEMENTO_ARREGLO_PARA_SUBTITULO1 @"departamento"//Nombre de la llave que tiene los datos del subtítulo
#define ELEMENTO_ARREGLO_PARA_SUBTITULO2 @"fecha"

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
    NSLog(@"Se recibió respuesta del servidor...");
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
    //NSLog(@"Datos del arreglo de a partir del diccionario %@",arregloDelDiccionariodeDatos);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    arregloDatos = [NSMutableArray arrayWithArray:arregloDelDiccionariodeDatos];
    [tablaDatos reloadData];
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Falló la conexión");
    NSLog(@"Error:%@",[error debugDescription]);
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
    NSString *subtitulo1 = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:ELEMENTO_ARREGLO_PARA_SUBTITULO1];
    NSString *subtitulo2 = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:ELEMENTO_ARREGLO_PARA_SUBTITULO2];
    NSString *subtitulo = [subtitulo1 stringByAppendingString:subtitulo2];
    cell.textLabel.text = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:ELEMENTO_ARREGLO_PARA_TITULO];
    cell.detailTextLabel.text = subtitulo;
   
    return cell;
}


#pragma mark - Navegacion al detalle después de seleccionar la fila


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    NSLog(@"Inicia transición");
    
    if([sender isKindOfClass:[UITableViewCell class]]){
        NSIndexPath *indice = [tablaDatos indexPathForCell:sender];
        NSLog(@"Identificada la celda que envía");
        if(indice){
            NSLog(@"Identificado el indice");
            if([segue.identifier isEqualToString:@"Detalle Drogas"]){
                NSLog(@"Identificada la transición");
                if([segue.destinationViewController isKindOfClass:[detalleContradiccionHome class]]){
                     NSLog(@"Identificado el controlador");
                    NSString *subtitulo = [[arregloDatos objectAtIndex:indice.row] objectForKey:ELEMENTO_ARREGLO_PARA_TITULO];
                    NSLog(@"%@",subtitulo);
                    [self configuraVista:segue.destinationViewController contitulo:subtitulo];
                }
            }
        }
    }
    NSLog(@"---------");
}

-(void)configuraVista:(detalleContradiccionHome *)vista contitulo:(NSString *)eltitulo{

    NSLog(@"Inicia método de configuraVista:contitulo------------");
    vista.textoTitulo = eltitulo;
    vista.title = eltitulo;
    [vista actualizarUI];
    
    
    
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
