# Changelog

All notable changes to the Validator Configuration for XRechnung and this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
<!--
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
-->

## UNRELEASED

This release is compatible with XRechnung ?.?.?

### Added

* Added custom level "error" for UBL-CR-646 in CVD UBL Invoice and UBL CreditNote scenarios to prohibit sub invoice lines in CVD

## 2025-07-10

This release is compatible with XRechnung 3.0.x

### Added

* Scenarios for matching XRechnung CVD invoices

### Changed

* Using [CEN Schematron Rules 1.3.14.2](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.14.2)
* Using [XRechnung Schematron 2.4.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-2.4.0)
* Using [XRechnung Testsuite 2025-07-10](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2025-07-10)


### Fixed

* severity level of UBL-SR-646 set to "information" in UBL Extension scenario to allow for sub invoice lines
* severity level of UBL-SR-646 set to "error" in UBL CIUS scenarios to prohibit sub invoice lines

## 2025-03-21

This release is compatible with XRechnung 3.0.x

### Added

* CEN unexpected test `cii-sr-030-wrong-cardinality-bt-22.xml`on missing BT-22 in CII

### Changed

* Using [CEN Schematron Rules 1.3.13](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.13)
* CEN Unit Test `cii-cii-sr-462-bt-8-cardinality-test.xml`
* `cii-br-dec-23-test.xml` moved from CEN Unexpected Tests to CEN Unit Tests
* added docs/usage.md to dist
* path to development.md in readme.md

## 2024-10-31

This release is compatible with XRechnung 3.0.x

### Added

* Custom level for BR-CL-24 in CII Extension to support BR-DEX-01

### Changed

* Using [XRechnung Schematron 2.2.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-2.2.0)
* Using [XRechnung Testsuite 2024-10-31](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2024-10-31)
* Custom level for BR-CL-24 in UBL Invoice Extension set to "information"
* Download URL for CII schema files to avoid build fail caused by captcha check
* CEN unit tests on CII-SR-461 and CII-SR-462 to consider identical and divergent duplicates of BT-7 and BT-8

## 2024-06-20

This release is compatible with XRechnung 3.0.x

**Because of new CII-SR-461 and CII-SR-462 (as part of CEN Rules version 1.3.12) and increase of CII-SR-452 and CII-SR-454 error levels it might break your validation and business workflow. Please evaluate impact!**

### Added

* CEN unexpected test on decimal places in BT-131 "Invoice line net amount" in CII
* CEN unexpected tests on BR-AE-02, BR-AE-03, and BR-AE-04 with BT-32 and no BT-31 in CII
* Unit tests for CII-SR-461 and CII-SR-462 - multiple BT-7 "Value added tax point date" and BT-8 "Value added tax point date code" in CII

### Changed

* Using [CEN Schematron Rules 1.3.12](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.12) 
* Using [XRechnung Schematron 2.1.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-2.1.0)
* Using [XRechnung Testsuite 2024-06-20](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2024-06-20)
* set CII-SR-452 customLevel to "error" to enforce correct cardinality of BT-9 "Payment due date" and BT-20 "Payment terms" in CII
* set CII-SR-454 customLevel to "error" to enforce exactly one BG-30 "Line VAT information" within BG-25 "Invoice line" in CII
* tests on BR-AE-02, BR-AE-03, and BR-AE-04 moved from `src/test/unexpected` to `src/test/cen-unit-tests`
* tests `cen-unit-test/cii-br-s-08-rounding-rule.xml` and `unexpected/br-co-23-reason-codes.xml` to comply with BR-CL-23
* tests `cen-unit-test/cii-br-e-10-test.xml` and `cen-unit-test/cii-br-e-10-test-2.xml` to comply with CII-SR-461


## 2023-11-15

This release is compatible with XRechnung 3.0.x

### Added

* Unit test on BR-53 with BT-5, BT-6 and BT-110 and BT-111 in CII.
* Unit test for BR-65 with multiple BT-158 in CII
* Unit test on multiple BT-20 "Payment terms" in CII
* Unit test on CII-SR-454
* Negative test for multiple BT-110 in UBL

### Changed

* Using [CEN Schematron Rules 1.3.11](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.11)
* Using [XRechnung Schematron 2.0.2](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-2.0.2)
* set CII-SR-453 customLevel to "error"

## 2023-09-22

This release is compatible with XRechnung 3.0.x

### Changed

* Using [XRechnung Schematron 2.0.1](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-2.0.1)
* Using [XRechnung Testsuite 2023-09-22](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2023-09-22)

## 2023-07-31

This release is compatible with XRechnung 3.0.x

### Changed

* Using [CEN Schematron Rules 1.3.10](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.10)
* Using [XRechnung Schematron 2.0.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-2.0.0)
* Using [XRechnung Testsuite 2023-07-31](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2023-07-31)
* Test files in accordance with new Schematron rules (see [XRechnung Schematron 2.0.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-2.0.0))
* Removed task `remove` from  Ant target `create-validator-reports-from-testsuite`

## 2023-05-12

This release is compatible with XRechnung 2.3.x

### Added

* Documentation of scenarios' custom levels
* Test for BR-CO-17 and BR-S-09 rounding rules in UBL
* Tests to monitor implementation of BR-E-10

### Changed

* Using [XRechnung Schematron 1.8.2](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.8.2)
* Using [XRechnung Testsuite 2023-05-12](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2023-05-12)
* Tests for BR-CO-17 and BR-S-09 rounding rules in CII merged
* Unified UBL Invoice and Credit Note handling to integrate Schematron merge of UBL Invoice and Credit Note.

## 2023-02-17

This release is compatible with XRechnung 2.3.x

### Changed

* Using [XRechnung Schematron 1.8.1](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.8.1)

## 2023-01-31

This release is compatible with XRechnung 2.3.x

### Added

* Test for Third Party Payment
* Test for BR-CO-17 on currencies with rounding at totals in CII.

### Changed

* Using [CEN Schematron Rules 1.3.9](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.9)
* Using [XRechnung Schematron 1.8.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.8.0)
* Using [XRechnung Testsuite 2023-01-31](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2023-01-31)
* Using [KoSIT Validator v1.5.0](https://github.com/itplr-kosit/validator/releases/tag/v1.5.0)
* Tests to adhere to new CEN Rule set
* Switched off rules BR-CO-16 and UBL-CR-470 in UBL Extension scenario for Third Party Payment implementation

## 2022-11-15

This release is compatible with XRechnung 2.2.0

### Added

* Tests on interference of BR-DE-16 with BR-O-02, BR-O-03, and BR-O-04
* Tests to monitor status of temporary Kosovo country codes "1A" and "XK" 
* Test to monitor implementation of HUF rounding rules
* Test to monitor implementation of BR-CO-25
* infrastructure to validate custom tests via Ant target `create-validator-reports-from-custom-tests`

### Changed

* Unexpected behaviour tests follow target state logic
* Replaced hardcoded XR extension version in `scenarios.xml`

### Fixed

* removed empty file in `test/unexpected`

## 2022-07-15

This release is compatible with XRechnung 2.2.0

### Added

* Tests for unexpected behaviour of cen rules (see [Development Doc](./docs/development.md) "Unexpected Behaviour of CEN Rules")
* Tests for BR-53 and BR-CO-15 in CII with same BT-5 and BT-6

### Changed

Using [XRechnung Testsuite 2022-07-15](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2022-07-15)

## 2022-05-31
This release is compatible with XRechnung 2.2.0

### Changed

* Using [XRechnung Schematron 1.7.2](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.7.2)
* Using [XRechnung Testsuite 2022-05-31](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2022-05-31)

## 2022-02-07

This release is compatible with XRechnung 2.2.0

### Changed

* Using [XRechnung Schematron 1.7.1](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.7.1)

## 2022-01-31

This release is compatible with XRechnung 2.2.0
Because of new CEN Rules version 1.3.7 and XRechnung Schematron 1.7.0 it might break your validation and business workflow. Please evaluate impact!

### Added

* Scenario for CII Extension
* Set custom rule levels of `BR-CL-10`, `BR-CL-11`, `BR-CL-25`, and `BR-CL-26`to "information" in Extension scenarios
* Integration tests for the custom levels of the Extension scenarios

### Changed

* Using [CEN Schematron Rules 1.3.7](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.7)
* Using [XRechnung Schematron 1.7.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.7.0)
* Using [XRechnung Testsuite 2022-01-31](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2022-01-31) 

## 2021-11-15

This release is compatible to XRechnung 2.1.1.

### Changed

* Using [XRechnung Schematron 1.6.1](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.6.1)
* Using [XRechnung Testsuite 2021-11-15](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2021-11-15)

## 2021-07-31

This release is compatible to XRechnung 2.1.1.
Because of new and custom fixed CEN Rules version 1.3.6a and XRechnung Schematron 1.6.0 it might break your validation and business workflow. Please evaluate impact!

### Changed

* Using KoSIT Validator v1.4.2
* Using [CEN Schematron Rules 1.3.6a](https://github.com/phax/eInvoicing-EN16931/releases/tag/validation-1.3.6a) from a fork fixing Rule BR-CO-15 
* Using [XRechnung Schematron 1.6.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.6.0)
* Using [XRechnung Testsuite 2021-07-31](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2021-07-31)
* Enhanced `development.md` documentation (thx to phax)

### Added

* Release HowTo section in development.md

## 2020-12-31

This release is compatible to XRechnung 2.0.1.

Because of new CEN Rules version 1.3.3 and XRechnung Schematron 1.5.0 it might break your validation and business workflow. Please evaluate impact!

### Changed

* Using [CEN Schematron Rules 1.3.3](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.3)
* Using [XRechnung Schematron 1.5.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.5.0)
* Using [XRechnung Testsuite 2020-12-31](https://github.com/itplr-kosit/xrechnung-testsuite/releases/tag/release-2020-12-31)
* More documentation on testing and build infrastructure

### Added

* Integration testing to avoid configuration errors

### FIXED

* Custom error levels also for CreditNote and CII

<!-- Older releases -->

## 2020-07-31

This release is compatible to XRechnung 2.0.0.

Because of new CEN Rules version 1.3.2 it might break your validation and business workflow. Please evaluate impact!

### Changed

* Build assumes a java runtime version > 8
* Build and test with validator version 1.4.0

### Added

* Scenarios for matching general EN 16931 invoices
* Full automatic test against xrechnung-testsuite
* Introduced development.build.properties for local developers of xrechnung configuration

### Changed

* Now include XRechnung [Schematron Rules 1.4.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.4.0)
* Include [CEN Rules 1.3.2](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.2)

## v2019-12-30

This release is compatible to XRechnung 1.2.2.

Because of new CEN Rules version 1.3.0 and several commits since then it might break your validation and business workflow. Please evaluate impact!

### Added

* Use of xml-mutate for integration tests of CEN rules in build script

### Changed

* Now include XRechnung [Schematron Rules 1.3.0](https://github.com/itplr-kosit/xrechnung-schematron/releases/tag/release-1.3.0)
* Include [CEN Rules 1.3.0](https://github.com/ConnectingEurope/eInvoicing-EN16931/releases/tag/validation-1.3.0) and commits [until 2019-12-23](https://github.com/ConnectingEurope/eInvoicing-EN16931/tree/618ae95f35d4f2a1187eee5e0f63695fde87fbd6)

## v2019-06-24

This release is compatible to XRechnung 1.2.1.

Because of new CEN Rules 1.2.1 it might break your validation and business workflow. Please evaluate impact!

### Changed

* Now include XRechnung Schematron Rules 1.2.1
* Include CEN Rules 1.2.1

## v2018-12-19

This release is compatible to XRechnung 1.2.0.

Because of new XRechnung Schematron Rules 1.2.0 it might break your validation and business workflow. Please evaluate impact!

### Added

* Changelog

### Changed

* Now include XRechnung Schematron Rules 1.2.0
* Made Scenario match only new XRechnung Version 1.2.0 Specification Identifier BT-24 (see #6)
