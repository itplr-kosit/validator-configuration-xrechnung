# Development of Validator Configuration XRechnung

## Dependencies overview

### Compile time

The following dependencies are downloaded automatically from within the build script:

* UBL Schema
* CII Schema
* CEN Schematron
* Saxon HE 9.9.x

### Testing

* KoSIT XML Validator
* XML Mutate
* XRechnung Testsuite

### Installing XML Mutate

`XML Mutate` needs to be build and setup manually - see https://projekte.kosit.org/kosit/xml-mutate for installation details.

Additionally a custom property needs to point to the XML Mutate binary and the version
* Property `xmute.download.url.prefix` indicates the URL to the cloned repository (as e.g. in `file:///../xml-mutate`)
* Property `xmute.version.full` indicates the full version number of the created binary JAR file (defaults to `0.5`).

Example Ant call (for Windows users):

```
ant clean dist \
  -Dxmute.download.url.prefix=file:///C:/dev/git3p/xml-mutate \
  -Dxmute.version.full=0.5
```

## The build environment

We recommend `ant` version 1.10.x or newer (but should work with > 1.8.x).

The main `ant` targets for developing are:

* `clean`
* `compile` (here it is assembling all resources for validation)
* `test`
* and `dist` (creating the distribution artefact)

However, because of the complex dependencies, you may only expect `compile` target to work without any customizations.

### Test dependencies on the fly

If you build own local custom versions of dependencies such as XRechnung Schematron you can customize the ant build at runtime:

The following example demonstrates how to use a different CEN Schematron release:

```shell
ant clean dist \
  -Dcen.rules.version=1.3.5
```

The following example demonstrates how to use a different CEN Schematron release, downloaded from the CEN GitHub repository:

```shell
ant clean dist \
  -Dcen.rules.version=1.3.5 \
```

To test with the latest SNAPSHOT versions of the CEN rules, add the following property to the Ant call:

```shell
ant clean dist \
  -Dcen.rules.version=master
```

Note: `master` is symbolic name for latest code from Git master branch.

Note: please make sure that after using a custom CEN rule version, to call `ant clean` afterwards to ensure the default version is restored correctly.

### Development properties file

In order to configure more complex adoption to the local development needs, you have to load a set of different properties from a file.

We provide the `development.build.properties.example` file for the most common properties to be set different than default. It contains some documentation.

You have to copy the file to e.g. `development.build.properties` and you have to explicitly provide the property file location at CLI for your development (otherwise tests will always fail or not be executed at all).

```shell
ant -propertyfile ${your.own.property.file.name}
```

Hint: we recommend that you place the properties `xmute.download.url.prefix` and `xmute.version.full` in this file.

## Test Approach

### Configuration Report Tests

All test instances in `src/test/instances` are designed to trigger certain kinds of report outputs. This is to test the report output on a technical level.

These reports are then tested using `src/test/assertions.xml`.

Ant call:

```shell
ant test-validator-assertions
```

### XRechnung Testsuite

This test phase runs the KoSIT validator against all XRechnung Testsuite instances and expects all instances to be valid.

Ant call:

```shell
ant create-validator-reports-from-testsuite
```

### CEN Unit Tests

The correctness of the whole validation process depends mostly on Schematron rules as implemented by CEN.
Hence, we started to also test aspects of those rules.

Currently, test instances are in `src/test/cen-unit-test` and tested using `XML Mutate`. We use positive and negative tests to verify the expected behavior of the CEN rules.

Filenames follow this convention:

`${cii,ubl}-${schematron-rule-id}-${description}.xml`

If more than one rule is tested than omit `${schematron-rule-id}`.

Ant call:

```shell
ant test-integration
```

### XRechnung Integration Tests

Finally, the generated test instances -- which are generated by XML-Mutate from the previous CEN Unit Tests build step -- are run with the fully configured Validator Configuration.

This allows to also test the correct behavior of the whole integrated validation procedure in case of wrong input also including effects of changing severity of validation rules on the calculation of the final assessment (recommendation).

The integration test are coded in `src/test/assertions-integration-tests.xml`

Ant call:

```shell
ant test-integration
```

## Distribution

The `ant` target `dist` creates the distribution zip archive for releases including several targets for testing.

If you want to skip tests call `ant dist-only`.
