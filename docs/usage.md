# Usage

This section is for technically skilled people only.
Change according to your environment.

In an empty directory:

## Using the released artifacts

1. Downloads:

```shell
# download validator
curl -L "https://github.com/itplr-kosit/validator/releases/download/v1.5.0/validator-1.5.0-distribution.zip" --output validator.zip

# download configuration (for 3.0.2)
curl -L "https://github.com/itplr-kosit/validator-configuration-xrechnung/releases/download/release-2025-03-21/validator-configuration-xrechnung_3.0.2_2025-03-21.zip" --output validator-configuration.zip

# download one most recent test document
curl -L "https://raw.githubusercontent.com/itplr-kosit/xrechnung-testsuite/master/src/test/business-cases/standard/01.01a-INVOICE_ubl.xml" --output ubl.xml

# show content of directory
ls
# should show something like this:
# ubl.xml validator.zip  validator-configuration.zip
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
java -jar ${jar_of_your_choice}.jar -s scenarios.xml -r ${PWD} -h ubl.xml
```

Validation reports are then written to `${test-document-file-name}-report.xml` and `${test-document-file-name}-report.html` e.g. `ubl-report.xml` and `ubl-report.html` according to above example.
