# XRechnung Validation Configuration

This is the configuration to specifically validate documents against the German XRechnung standard using the KoSIT Validation Tool.

## Validation Configuration

The KoSIT Validation Tool uses the `scenario.xml` file to read three specific validation scenarious for XRechnung.

It validates against

1. UBL Invoice documents using
    - UBL Invoice XML Schema
    - UBL Schematron Rules
    - XRechnung Schematron
1. UBL CreditNote docuemnts using
    - UBL Credit NOte XML Schema
    - UBL Schematron Rules
    - XRechnung Schematron
1. UN/CEFACT documents using
    - UN/CEFACT CII XML Schema
    - UN/CEFACT CII Schematron
    - XRechnung Schematron

## Build Validation Configuration

The ant build performs the following tasks

1. Gets the Schematron Files for EN16931 business rules from ...
2. Gets CIUS schematrons
3. Createte XSLT
4. tests the configuration with validation tool


### Project Directory Layout

This project basically follows a typical ant directory structure:

* `./src` contains all relevant source files
* `./build` contains all downloads of third party libs and code and generation of configurtion
* `./dist` contains the final release zip archive


