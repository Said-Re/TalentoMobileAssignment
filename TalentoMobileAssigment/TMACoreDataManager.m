//
//  CoreDataManager.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 9/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACoreDataManager.h"

@interface TMACoreDataManager ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation TMACoreDataManager

- (id)init
{
    if ((self = [super init]))
    {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        NSError *error = nil;
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"Model.sqlite"];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:nil error:&error];
        
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        _managedObjectContext.undoManager = nil;
        
    }
    
    return self;
}

- (void)fetchCitiesFromHistory:(void (^)(NSArray *results))completionBlock
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"City"];
    
    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
        completionBlock(results);
    }];
}

- (void)saveCityInHistoryWithName:(NSString *)cityName
{
    if (![self checkIfCityAlreadyExistsCityWithName:cityName])
    {
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"City"
                                                             inManagedObjectContext:self.managedObjectContext];
        
        City *newCity = (City *)[[NSManagedObject alloc] initWithEntity:entityDescription
                                         insertIntoManagedObjectContext:self.managedObjectContext];
        newCity.name = cityName;
        
        [self save];
    }
}

- (BOOL)checkIfCityAlreadyExistsCityWithName:(NSString *)cityName
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"City"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name = %@", cityName]];
    [request setFetchLimit:1];
    
    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:nil];
    if (count == 0)
        return NO;
    else
        return YES;
}

- (void)save
{
    [self.managedObjectContext save:nil];
}

@end