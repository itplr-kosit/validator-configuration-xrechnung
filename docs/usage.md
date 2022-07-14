# Usage

This section is for technically skilled people only.
Change according to your environment.

In an empty directory:

## Using the released artifacts

1. Downloads:

```shell
# download validator
curl -L "https://github.com/itplr-kosit/validator/releases/download/v1.4.2/validator-1.4.2-distribution.zip" --output validator.zip

# download configuration (for 2.2.0)
curl -L "https://github.com/itplr-kosit/validator-configuration-xrechnung/releases/download/release-2022-05-31/validator-configuration-xrechnung_2.2.0_2022-05-31.zip" --output validator-configuration.zip

# download one most recent test document
curl -L "https://raw.githubusercontent.com/itplr-kosit/xrechnung-testsuite/master/src/test/business-cases/standard/01.01a-INVOICE_ubl.xml" --output ubl.xml

# show content of directory
ls
# should show something like this:
ubl.xml validator.zip  validator-configuration.zip
```

2. Unzip

Requires the `unzip` commandline application.

```shell
unzip validator.zip
unzip validator-configuration.zip
```

3. Run Validator

Requires the `java` commandline application. See the [validator repository](https://github.com/itplr-kosit/validator) for system requirements.

```shell
java -jar ${jar_of_your_choice}.jar -s scenarios.xml  -h ubl.xml
```

Validation reports are then written to `${test-document-file-name}-report.xml` and `${test-document-file-name}-report.html` e.g. `ubl-report.xml` and `ubl-report.html` according to above example.
