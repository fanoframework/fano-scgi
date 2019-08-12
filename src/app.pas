(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
program app;

uses

    fano,
    bootstrap,
    ServiceContainer;

var
    appInstance : IWebApplication;

begin
    writeln('Starting application at 127.0.0.1:4000');

    (*!-----------------------------------------------
     * Bootstrap application
     *
     * @author AUTHOR_NAME <author@email.tld>
     *------------------------------------------------*)
    appInstance := TBootstrapApp.create(
        '127.0.0.1',
        4000,
        TServiceContainer.create(
            TDependencyContainer.create(TDependencyList.create())
        )
    );
    appInstance.run();
end.
