# Development of Validator Configuration XRechnung

## The build environment

We recommend `ant` version 1.10.x or newer (but should work with > 1.8.x).

The main `ant` targets for developing are:

* `compile` (here it is assembling all resources for validation)
* `test`
* and `dist` (creating the distribution artefact)

However, because of the complex dependencies, you may only expect `compile` target to work without any customizations.

### Test dependencies on the fly

If you build own local custom versions of dependencies such as XRechnung Schematron you can customize the ant build at runtime:

The following example demonstrates how to use a different CEN schematron distribution:
```shell
ant
-Dcen.rules.version=1.3.0
```

### Development properties file

In order to configure more complex adaption to the local development needs, you have to load a set of different properties from a file.

We provide the `development.build.properties.example` file for the most common properties to be set different than default. It contains some documentation.

You have to copy the file to e.g. `development.build.properties` and you have to explicitly provide the property file location at CLI for your development (otherwise tests will always fail or not exectuted at all).

```shell
ant -propertyfile ${your.own.property.file.name}
```

### Dependencies overview

#### Compile time

* UBL Schema
* CII Schema
* CEN Schema
* Saxon HE

#### Testing

* KoSIT XML Validator
* XML Mutate
* XRechnung Testsuite

## Test Approach

### Configuration Report Tests

All test instances in `src/test/instances` are designed to trigger certain kinds of report outputs.

These reports are then tested using `src/test/assertions.xml`.


### XRechnung Testsuite

This test phase also runs the KoSIT validator against all XRechnung Testsuite instances and expects all instances to be valid.

### CEN Integration Tests

The correctness of the whole validation process depends mostly on Schematron rules as implemented by CEN.
Hence, we started to also test aspects of these rules.

Currently, test instances are in `src/test/ubl-inv` and tested using `XML Mutate`.

## Distribution

The `ant` target `dist` creates the distribution zip archive for releases including several targets for testing.

If you want to skip tests call `ant dist-only`.
