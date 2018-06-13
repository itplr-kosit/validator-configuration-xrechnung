# Validator Configuration for XRechnung

[Validator](https://github.com/itplr-kosit/validator) configuration for Universal Business Language (UBL) and UN/CEFACT Invoice and CreditNote documents against EN16931:2017 and the German [Core Invoice Usage Specification (CIUS) XRechnung 1.1](https://www.xoev.de/de/xrechnung/1_1).

It contains all necessary XML Schema and Schematrons to validate UBL and CII invoice XML documents for conformity with [CIUS XRechnung 1.1](https://www.xoev.de/de/xrechnung/1_1).

In particular:

* [Schematron of EN16931:2017](https://github.com/CenPC434/validation)
* [Schematron of CIUS XRechnung](https://github.com/itplr-kosit/xrechnung-artefacts/)
* [XML Schema of UBL Invoice and CreditNote version 2.1](http://docs.oasis-open.org/ubl/os-UBL-2.1/)
* [XML Schema of UN/CEFACT uncoupled version 16b](http://www.unece.org/cefact/xml_schemas/index.html)

## Usage

Change according to your environment.

In an empty directory:

1. Downloads:

```shell
# download validator
curl -L 'https://github.com/itplr-kosit/validator/releases/download/validationtool-1_0_1/validationtool-dist-1.0.1-standalone.zip' --output validator.zip

# download configuration
curl -L 'https://github.com/itplr-kosit/validator-configuration-xrechnung/releases/download/release-2018-03-05/validator-configuration-xrechnung_1.1_2018-03-05.zip' --output validator-configura
tion.zip

# download a test document
curl -L 'https://raw.githubusercontent.com/itplr-kosit/xrechnung-testsuite/master/instances/01.01a-INVOICE_ubl.xml' --output ubl.xml
# show content of directory
ls
# should show something like this:
ubl.xml validator.zip  validator-configuration.zip
```

2. Unzip

```
unzip validator.zip
unzip validator-configuration.zip
```

3. Run Validator

```shell
java -jar validationtool-1.0.1-standalone.jar -s scenarios.xml  -h ubl.xml
```

Validation reports are then written to `${test-document-file-name}-report.xml` and `${test-document-file-name}-report.html` e.g. `ubl-report.xml` and `ubl-report.html` according to above example.


## Versioning

The git master branch always has the latest code. Since March 2018 new releases have the following naming and versioning scheme:

The source code gets tagged with `release-${release-date}` and distributions get the name `validator-configuration-xrechnung_${xrechnung-version}_${release-date}` e.g. `validator-configuration-xrechnung_1.1_2018-03-05.zip`

## Releases

A release only contains the XML Schema and Schematrons for the validator configuration for XRechnung.

It is always recommended to update to the latest release.

Here you can [download the latest release](https://github.com/itplr-kosit/validator-configuration-xrechnung/releases/latest).

## Build from Scratch

This repository contains an ANT `build.xml` which allows downloading all neccessary tools and artefacts for creating this validator configuration for XRechnung.
```
ant complie
```

It also allows testing the configuration against a few UBL and UN/CEFACT documents and creates a release zip file.

## Translations of Schematron Rule Messages

For many contexts the messages of failed schematron rules are too technical and lack context specific hints for solving the issue. Hence this configuration includes a simple mechanism for translating/replacing schematron messages.

By default **NO** translation will take place while building the configuration. And **NO** translation will be part of any release provided by KoSIT. Hence you need to apply the translation on your own.

### Build translations
Once you cloned this repository, you can add a file with the name `xrechnung-schematron-translations.xml` in the `./src/translations` directory. There you will also find an example file which is similar to:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<tr:translations xmlns:tr="http://www.xoev.de/de/validator/framework/1/translation">
    <!-- id muss der assertion id in schematron entsprechen -->
    <tr:what id="BR-CL-03">
        <tr:to xml:lang="de">Die angegebene Waehrung muss ein gueltiges Kuerzel aus der ISO Codeliste 4217 sein. Z.B. EUR fuer Euro.</tr:to>
    </tr:what>
    <tr:what id="BR-CL-04">
        <!-- Leeres <to> fuehrt zu keiner Uebersetzung -->
        <tr:to></tr:to>
    </tr:what>
</tr:translations>
```
If the file `xrechnung-schematron-translations.xml` with the content similar to the above code snippet is present then

```shell
ant compile
```
will execute the `translate-schematron-rules` target automatically. Otherwise it will *silently* skip this target.

### Translation procedure

the translation is implemented using the `./src/translations/schematron-assert-message-translator.xsl` XSLT script.

It looks for each schematron assert id if a translation with the same id is present in the `xrechnung-schematron-translations.xml`.

Therefore if an assertion with `id=BR-CL-03` is found

```xml
<assert test="<!-- left out -->" id="BR-CL-03" flag="fatal">Die angegebene Waehrung muss ein gueltiges Kuerzel aus der ISO Codeliste 4217 sein. Z.B. EUR fuer Euro.</assert>

```
it will replace the text content of the assert element with the text contennt of the tr element in `<tr:what id="BR-CL-03">`:

<tr:what id="BR-CL-03">
  <tr:to xml:lang="de">Die angegebene Waehrung muss ein gueltiges Kuerzel aus der ISO Codeliste 4217 sein. Z.B. EUR fuer Euro.</tr:to>
</tr:what>

Otherwise the assert text content is not changed.
