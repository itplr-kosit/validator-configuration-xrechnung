<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tr="http://www.xoev.de/de/validator/framework/1/translation"
    exclude-result-prefixes="xs" version="2.0">

    
    <xsl:variable name="translations-uri" select="'xrechnung-schematron-translations.xml'" as="xs:string"/>
    <xsl:variable name="tr-doc" select="if ( doc-available($translations-uri)) then doc($translations-uri) else error( (),'Error loading translations xml file')"/>
    <xsl:variable name="tr-doc-root-path" select="$tr-doc/tr:translations"/>
    <xsl:variable name="tr-what-path" select="$tr-doc-root-path/tr:what"/>
    
    <xsl:template match="element()">
        <xsl:copy>
            <xsl:apply-templates select="@*,node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="attribute() | text() | comment() | processing-instruction()">
        <xsl:copy/>
    </xsl:template>

    <xsl:template match="/sch:pattern/sch:rule/sch:assert/text()">
        
        <xsl:choose>
            <xsl:when
                test="$tr-what-path[@id = current()/../@id] and not(empty($tr-what-path[@id = current()/../@id]/tr:to/text()))" >
                
                <xsl:value-of
                    select="$tr-what-path[@id = current()/../@id]/tr:to/text()"
                />
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

</xsl:stylesheet>
