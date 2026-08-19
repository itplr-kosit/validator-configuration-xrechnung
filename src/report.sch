<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:ns uri="http://www.xoev.de/de/validator/varl/1" prefix="rep"/>
    <sch:ns uri="http://www.xoev.de/de/validator/framework/1/scenarios" prefix="s"/>

    <sch:pattern>
        <sch:rule context="rep:report">
            <sch:assert test="@varlVersion='1.0.0'">VARL version must be 1.0.0.</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <sch:rule context="rep:report[rep:noScenarioMatched]">
            <sch:assert test="@valid='false'">If no scenario matched, then the report must be flagged invalid.</sch:assert>
        </sch:rule>
        <sch:rule context="rep:report[rep:scenarioMatched/rep:validationStepResult[@valid = 'false']]">
            <sch:assert test="@valid='false'">If any validation step has been flagged invalid, then the report must be flagged invalid.</sch:assert>
        </sch:rule>
        <sch:rule context="rep:report[rep:scenarioMatched and empty(rep:scenarioMatched/rep:validationStepResult[@valid = 'false'])]">
            <sch:assert test="@valid='true'">If a scenario matched and no validation step has been flagged invalid, then the report must be flagged valid.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule context="rep:scenarioMatched[rep:validationStepResult[@id = 'val-xsd' and @valid='true']]">
            <sch:assert test="rep:validationStepResult[@id = 'val-sch.1']">If xsd is valid then schematron checks have to be performed.</sch:assert>
        </sch:rule>
        <sch:rule context="rep:scenarioMatched[rep:validationStepResult[@id = 'val-xsd' and @valid='false']]">
            <sch:assert test="empty(rep:validationStepResult[@id = 'val-sch.1'])">If xsd is invalid then schematron checks must not be performed.</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <sch:rule context="rep:validationStepResult[rep:message[@level=('error','warning')]]">
            <sch:assert test="@valid = 'false'">If a validation step has errors or warnings, it must be flagged invalid.</sch:assert>
        </sch:rule>
        <sch:rule context="rep:validationStepResult[not(rep:message[@level=('error','warning')])]">
            <sch:assert test="@valid = 'true'">If a validation step has no errors or warnings, it must be flagged valid.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <!-- The wellformedness step of a report in which no scenario matched. Narrowed to steps
             that actually reported something: ubl006 is well-formed and merely has no scenario
             configured, so its val-xml step is valid and carries no message at all. Without the
             [rep:message] predicate these assertions would fail on it. -->
        <sch:rule context="rep:report/rep:noScenarioMatched/rep:validationStepResult[@id = 'val-xml'][rep:message]">
            <sch:assert test="@valid = 'false'">If the wellformedness step reported a message, the step must be flagged invalid.</sch:assert>
            <sch:assert test="rep:message[@code = 'generic-error']">A wellformedness error on unparsable input must at least state an error code.</sch:assert>
            <sch:assert test="rep:message[@level = 'error']">A wellformedness error on unparsable input must always have the level error.</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <!-- Input that cannot be parsed at all is reported by the XML parser with
             rowNumber/columnNumber -1, so default-report.xsl has no location to emit. Such a
             message is exempt from the location requirement, but must still say something -
             xs:normalizedString permits an empty text node, so this can genuinely fail.
             Everywhere else - including val-xml of a document that did match a scenario - a
             location remains mandatory. The narrow rule must stay first: within a pattern the
             first matching rule wins, and that is what shields these messages from the second. -->
        <sch:rule context="rep:message[parent::rep:validationStepResult/@id = 'val-xml'][ancestor::rep:noScenarioMatched]">
            <sch:assert test="normalize-space(.)">A wellformedness error on unparsable input gives no location, so it must at least explain the failure in its message text.</sch:assert>
        </sch:rule>
        <sch:rule context="rep:message">
            <sch:assert test="@lineNumber or @xpathLocation">Some kind of error location must be given.</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Specific tests on specific test instances, see (src/test/instances/) -->
    <sch:pattern>
        <sch:rule context="rep:report[ends-with(normalize-space(rep:documentIdentification/rep:documentReference), '/bin001.xml')]">
            <sch:assert test="empty(rep:scenarioMatched)">On a non wellformed input, no element with the name scenarioMatched must be present.</sch:assert>
            <sch:assert test="rep:noScenarioMatched">On a non wellformed input, an element with the name noScenarioMatched must be present.</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Specific tests on specific test instances, see (src/test/instances/) -->
    <sch:pattern>
        <sch:rule context="rep:report[ends-with(normalize-space(rep:documentIdentification/rep:documentReference), '/ubl007.xml')]">
            <sch:assert test="empty(rep:scenarioMatched)">On a non wellformed input, no element with the name scenarioMatched must be present.</sch:assert>
            <sch:assert test="rep:noScenarioMatched">On a non wellformed input, an element with the name noScenarioMatched must be present.</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Test reports as a result of no scenario matched -->
    <sch:pattern>
        <!-- Assessment shape whenever no scenario matched. Covers both the unparsable
             instances in src/test/instances/processing-error (bin001, ubl007) and a
             well-formed document for which no scenario is configured (ubl006). -->
        <sch:rule context="rep:report[rep:noScenarioMatched]">
            <sch:assert test="empty(rep:scenarioMatched)">A report must not carry both noScenarioMatched and scenarioMatched.</sch:assert>
            <sch:assert test="rep:assessment/rep:reject">If no scenario matched, the assessment must reject the document.</sch:assert>
            <sch:assert test="empty(rep:assessment/rep:accept)">If no scenario matched, the assessment must not recommend acceptance.</sch:assert>
        </sch:rule>
    </sch:pattern>

</sch:schema>
