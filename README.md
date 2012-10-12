# TomEE 1.5 ClickStack

TomEE 1.5 ClickStack for CloudBees PaaS. Deploy any Servlet2.x/3.x/JSP or Java EE Web Profile app.

# Pre-requisite

* OpenJDK 6
* Bash shell
* Make tools

# Build 

    $ make package

After successful build tomee15-plugin.zip is created and can be uploaded to the CloudBees platform location by the CloudBees team.

# Package and Deploy Sample App

## Create application zip file
    $ cd example
    $ zip -r ../build/hello.zip hello/ 
    $ cd ..

## Deploy 

    $ bees app:deploy -a APP_ID -t tomcat7  build/hello.war


## TODOs
* Support injection of Database resources
* Add idle/active timeouts
* Add stats polling support

