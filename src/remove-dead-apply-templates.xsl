<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- TODO: <xsl:template match="cbc:CompanyID/@schemeID[not(ancestor::cac:PartyTaxScheme)]" mode="M13" priority="1011"> wird noch nicht erkannt-->
    <xsl:template match="xsl:template[matches(@match,'@\w+$')]/xsl:apply-templates[@select='*']"/>
    
    <xsl:template match="svrl:fired-rule"/>
    
    <xsl:template match="xsl:apply-templates[@select='.' and @mode='schematron-get-full-path']">
        <xsl:copy>
            <xsl:attribute name="select">.</xsl:attribute>
            <xsl:attribute name="mode">schematron-get-full-path-2</xsl:attribute>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>