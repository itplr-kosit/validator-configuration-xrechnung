# Development of XRechnung Configuration

## Test dependencies on the fly

If you build own local custom versions of dependencies such as XRechnung
Schematron you can customize the ant build at runtime:

The following example demonstrates how to use a diffeerent CEN SChamtron rules distribution:
```shell
ant
-Dcen.rules.version=1.3.0
```

## Development properties file

In order to configure more complex adaption to the local development needs, you have to load a set of different properties from a file. 

We provide the `development.build.properties.example` file for the most common properties to be set different than default. It contains some documentation. 

You have to copy the file to e.g. `development.build.properties` and you have to explicitly provide the property file location at CLI for your development (otherwise tests will always fail or not exectuted at all).

```shell
ant -propertyfile ${your.own.property.file.name}
```
