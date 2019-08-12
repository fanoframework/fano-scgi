(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ServiceContainer;

interface

uses

    fano;

type

    TServiceContainer = class(TInitializeableContainer)
    protected
        procedure initializeServices(const container : IDependencyContainer); override;
    end;

implementation

uses
    sysutils

    (*! -------------------------------
     *   controllers factory
     *----------------------------------- *)
    {---- put your controller factory here ---},
    HomeControllerFactory,
    HomeViewFactory;


    procedure TServiceContainer.initializeServices(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/dependencies.inc}
    end;
end.
