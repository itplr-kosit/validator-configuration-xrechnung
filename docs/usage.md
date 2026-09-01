# Usage

This section is for technically skilled people only.
Change according to your environment.

In an empty directory:

## Using the released artifacts

1. Downloads:

Note: We always refer the latest version of the validator. You can use a previous version according to your preference.
Since Validator 1.6.1, the standalone.jar is separated from the distribution package. The required artifacts can be downloaded from [Maven Central](https://repo1.maven.org/maven2/org/kosit/validator/). The preferred way is using the standalone-JAR.

```shell
# download validator standalone.jar
curl -L "https://repo1.maven.org/maven2/org/kosit/validator/1.6.3/validator-1.6.3-standalone.jar" --output validator-1.6.3-standalone.jar

# download configuration (for 3.0.2)
curl -L "https://github.com/itplr-kosit/validator-configuration-xrechnung/releases/download/v2026-08-31/xrechnung-3.0.2-validator-configuration-2026-08-31.zip" --output validator-configuration.zip

# download one most recent test document
curl -L "https://projekte.kosit.org/xrechnung/xrechnung-testsuite/-/raw/master/src/test/business-cases/standard/01.01a-INVOICE_ubl.xml" --output ubl.xml

# show content of directory
ls
# should show something like this:
# ubl.xml validator-${validator.version}-standalone.jar validator-configuration.zip
```

2. Unzip

Requires the `unzip` commandline application.

```shell
unzip validator-configuration.zip
```

3. Run Validator

Requires the `java` commandline application with **Java 11 or later** (the validator bundled since release 2026-01-31 uses Validator v1.6.x, which requires Java 11+). See the [validator repository](https://github.com/itplr-kosit/validator) for full system requirements.

```shell
java -jar ${jar_of_your_choice}.jar -s scenarios.xml -r ${PWD} -h ubl.xml
```

Validation reports are then written to `${test-document-file-name}-report.xml` and `${test-document-file-name}-report.html` e.g. `ubl-report.xml` and `ubl-report.html` according to above example.
