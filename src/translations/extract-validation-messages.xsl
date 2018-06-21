<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:schematron="http://purl.oclc.org/dsdl/schematron"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" media-type="text/xml" omit-xml-declaration="no" indent="yes"/>

    <!--
    <assert test="$BR-50" flag="fatal" id="BR-50">[BR-50]-A Payment account identifier (BT-84) shall be present if Credit transfer (BG-16) information is provided in the Invoice.</assert>
    -->

    <xsl:template match="schematron:assert">
        <xsl:element name="message">
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:value-of select="./text()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/">
        <xsl:element name="messages">
            <xsl:apply-templates select="//schematron:assert[@id]"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
