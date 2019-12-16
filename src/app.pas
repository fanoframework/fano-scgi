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
    bootstrap;

var
    appInstance : IWebApplication;
    cliParams : ICliParams;
    host : string;
    port : word;

begin
    cliParams := (TGetOptsParams.create() as ICliParamsFactory)
        .addOption('host', 1)
        .addOption('port', 1)
        .build();
    host := cliParams.getOption('host', '127.0.0.1');
    port := cliParams.getOption('port', 4000);
    writeln('Starting application at ', host, ':', port);

    (*!-----------------------------------------------
     * Bootstrap application
     *
     * @author AUTHOR_NAME <author@email.tld>
     *------------------------------------------------*)
    appInstance := TDaemonWebApplication.create(
        TScgiAppServiceProvider.create(
            TServerAppServiceProvider.create(
                TMyAppServiceProvider.create(),
                TInetSocketSvr.create(host, port)
            )
        ),
        TMyAppRoutes.create()
    );
    appInstance.run();
end.
