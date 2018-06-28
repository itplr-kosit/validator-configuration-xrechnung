<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tr="http://www.xoev.de/de/validator/framework/1/translation"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="/messages">
        <xsl:element name="tr:translations">
            <xsl:apply-templates select="./message"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="message">
        <xsl:element name="tr:what">
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:element name="tr:to">
                <xsl:value-of select="./text()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
