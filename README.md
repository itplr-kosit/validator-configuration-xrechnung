# Validator Configuration for XRechnung

[Validator](https://github.com/itplr-kosit/validator) configuration for Universal Business Language (UBL) and UN/CEFACT Invoice and CreditNote documents against EN16931:2017 and the German [Core Invoice Usage Specification (CIUS) XRechnung and XRechnung Extension](https://www.xoev.de/die_standards/xrechnung-14741). It needs the [Validator](https://github.com/itplr-kosit/validator) to execute the rules.

Each [release](https://github.com/itplr-kosit/validator-configuration-xrechnung/releases) contains all necessary XML Schema and Schematron rules to validate UBL and CII invoice XML documents for conformity with [CIUS XRechnung](https://www.xoev.de/xrechnung-16828).

In particular this Validator Configuration integrates the following third-party artefacts:

* [Schematron of EN16931:2017](https://github.com/ConnectingEurope/eInvoicing-EN16931)
* [Schematron of CIUS XRechnung](https://github.com/itplr-kosit/xrechnung-schematron/)
* [XML Schema of UBL Invoice and CreditNote version 2.1](http://docs.oasis-open.org/ubl/os-UBL-2.1/)
* [XML Schema of UN/CEFACT uncoupled version 16B](http://www.unece.org/cefact/xml_schemas/index.html)

Please see the specific [docs/usage.md](page on usage).

## Versioning

The git master branch always has the latest code. Since March 2018 new releases have the following naming and versioning scheme:

The source code gets tagged with `release-${release-date}` and distributions get the name `validator-configuration-xrechnung_${xrechnung-version}_${release-date}` e.g. `validator-configuration-xrechnung_1.2.0_2018-12-19.zip`
