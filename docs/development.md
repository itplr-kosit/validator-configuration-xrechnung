# Development of XRechnung Configuration

## Test dependencies on the fly

If you build own local custom versions of dependencies such as XRechnung
Schematron you can customize the ant build at runtime:

This example show if you have a new XRechnung Schematron distribution build
locally with new version.

```shell
ant
-Dxrechnung.download.url=file:/${FULL_PATH}/xrechnung-schematron/dist/xrechnung-1.2.2-schematron-1.2.2.zip
\
-Dxrechnung.rules.version.patch=2 \
-Dxrechnung.version.patch=2 dist
```

Just use `-Dcen.rules.version=1.3.0` for testing a released version of CEN
Schematron rules.
