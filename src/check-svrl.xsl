<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
  version="2.0">

  <xsl:param name="svrl.dir" as="xs:string" xmlns:xs="http://www.w3.org/2001/XMLSchema"/>
  <xsl:param name="svrl.file.pattern" as="xs:string" xmlns:xs="http://www.w3.org/2001/XMLSchema" select="'*.svrl.xml'"/>

  <xsl:template match="/">
    <xsl:variable name="failures" as="element(svrl:failed-assert)*"
      select="collection(concat($svrl.dir, '?select=', $svrl.file.pattern))//svrl:failed-assert"/>

    <xsl:for-each select="$failures">
      <xsl:message>FAILED [<xsl:value-of select="@id"/>] in <xsl:value-of
          select="tokenize(base-uri(.), '/')[last()]"/>: <xsl:value-of select="normalize-space(svrl:text)"/></xsl:message>
    </xsl:for-each>

    <xsl:if test="exists($failures)">
      <xsl:message terminate="yes">ERROR: Schematron validation failed: <xsl:value-of
          select="count($failures)"/> assertion(s) failed across <xsl:value-of
          select="count(distinct-values($failures/base-uri(.)))"/> file(s). See messages above.</xsl:message>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
