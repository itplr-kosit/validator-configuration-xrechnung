<?xml version="1.0" encoding="UTF-8"?>
<!--
  Presentation-only KoSIT report customization.

  All validation, documentData, conformance and assessment templates are inherited
  unchanged from the official report stylesheets. The validation-results template
  below only changes HTML grouping, not the source of text, message identifiers,
  severities, XPath locations, or the raw-level summary calculations.
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rep="http://www.xoev.de/de/validator/varl/1"
    xmlns:s="http://www.xoev.de/de/validator/framework/1/scenarios"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs rep s html"
    version="2.0">

  <xsl:template name="html:head" as="element(html:head)" xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Prüfbericht</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <style type="text/css"><![CDATA[
:root {
  color-scheme: dark;
  --bg: #121516;
  --surface: #1b1f20;
  --surface-raised: #222728;
  --surface-hover: #282d2e;
  --border: #343a3b;
  --border-soft: #2b3032;
  --text: #e8ebea;
  --secondary: #b7bdbb;
  --muted: #959d9b;
  --error: #e39793;
  --error-bg: #3c2929;
  --warning: #dfbc77;
  --warning-bg: #393123;
  --success: #85b79a;
  --success-bg: #23352c;
  --info: #bcc4c2;
  --info-bg: #2b3132;
}

*, *::before, *::after { box-sizing: border-box; }
html { background: var(--bg); -webkit-text-size-adjust: 100%; }
body {
  margin: 0;
  background: var(--bg);
  color: var(--text);
  font: 400 13px/1.5 -apple-system, BlinkMacSystemFont, "Segoe UI", "IBM Plex Sans", Arial, sans-serif;
  letter-spacing: 0;
  text-rendering: optimizeLegibility;
}
.page { width: calc(100% - 48px); max-width: 1600px; margin: 24px auto 36px; }
.page-header { margin: 0 0 18px; padding: 0 0 14px; border-bottom: 1px solid var(--border); }
h1 { margin: 0; font-size: 24px; line-height: 1.25; font-weight: 650; letter-spacing: -.035em; }
.section {
  width: 100%; min-width: 0; margin-bottom: 14px; padding: 20px 22px;
  border: 1px solid var(--border); border-radius: 11px;
  background: var(--surface);

}
/* Original KoSIT metadata template and its unchanged labels and values. */
.metadata { margin: 0; padding: 0; }
.metadata > p.important, .document-section > p.important {
  margin: 0 0 16px; padding: 0 0 10px;
  border: 0; border-bottom: 1px solid var(--border-soft);
  border-radius: 0; background: none;
  color: var(--text); font-size: 13px; line-height: 1.35; font-weight: 650;
}
.metadata dl {
  display: grid;
  grid-template-columns: minmax(170px, 250px) minmax(0, 1fr);
  gap: 8px 18px; margin: 0; align-items: baseline;
}
.metadata dt, .metadata dd { float: none; clear: none; width: auto; min-width: 0; margin: 0; }
.metadata dt { font-size: 12px; font-weight: 550; color: var(--muted); }
.metadata dd { font-size: 12.5px; font-weight: 500; color: var(--text); overflow-wrap: anywhere; }
.metadata dl + dl { margin-top: 8px; }
.metadata b.error { color: var(--error); }
.metadata .tbl-meta { width: 100%; margin-top: 8px; }
.metadata .tbl-meta td { padding: 4px 12px 4px 0; border: 0; }

/* Exact KoSIT conformity and acceptance wording; only the visual tone changes. */
.conformance-section { padding: 15px 18px; }
.assessment-section { width: 100%; margin: 0 0 14px; }
.conformance-section p.important, .assessment-section p.important {
  margin: 0; padding: 13px 15px;
  border: 1px solid var(--border); border-radius: 8px;
  background: var(--surface-raised);
  color: var(--secondary); font-size: 12.5px; font-weight: 400; line-height: 1.55;
}
p.important b { color: var(--text); font-weight: 650; }
.conformance-section.is-success {
  border-color: #426b51;
  background: linear-gradient(115deg, rgba(62,140,91,.13), rgba(62,140,91,.025) 67%), var(--surface);
}
.conformance-section.is-success p.important {
  border-color: #477659; background: linear-gradient(90deg, rgba(50,121,78,.24), rgba(43,86,60,.14));
  color: #d4eadd;
}
.conformance-section.is-success p.important b { color: #b0e8c5; }
.conformance-section.is-issue {
  border-color: #705149;
  background: linear-gradient(115deg, rgba(144,77,61,.13), rgba(144,77,61,.025) 67%), var(--surface);
}
.conformance-section.is-caution {
  border-color: #78613c;
  background: linear-gradient(115deg, rgba(174,129,49,.13), rgba(174,129,49,.025) 67%), var(--surface);
}
.conformance-section.is-caution p.important {
  border-color: #806944;
  background: linear-gradient(90deg, rgba(147,111,46,.20), rgba(65,52,29,.14));
  color: #f0e0ba;
}
.conformance-section.is-caution p.important b { color: #f0cb84; }
.conformance-section.is-issue p.important {
  border-color: #705149; background: linear-gradient(90deg, rgba(144,77,61,.20), rgba(65,42,38,.14));
  color: #eed9d3;
}
.conformance-section.is-issue p.important b { color: #f5b1a3; }
.assessment-section p.important:not(.error) {
  border-color: #426b51; background: var(--success-bg); color: #d4eadd;
}
.assessment-section p.important.error {
  border-color: #754b46; background: var(--error-bg); color: #f6ceca;
}

/* Original four scorecards, now with restrained but visible green/red/amber/slate bars. */
.metrics {
  display: grid; grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 10px; margin-top: 12px;
}
.metric {
  position: relative; overflow: hidden; min-width: 0;
  padding: 14px 14px 12px;
  border: 1px solid var(--border); border-radius: 8px;
  background: var(--surface-raised);
}
.metric.success { --metric-color: #75c998; }
.metric.error { --metric-color: #e99d98; }
.metric.warning { --metric-color: #e2b566; }
.metric.information { --metric-color: #bbc3d0; }
.metric-label {
  display: block; margin-bottom: 6px; color: var(--muted);
  font-size: 10px; line-height: 1.35; font-weight: 650;
  letter-spacing: .055em; text-transform: uppercase;
}
.metric-value {
  display: block; font-size: 22px; line-height: 1.1;
  font-weight: 650; font-variant-numeric: tabular-nums;
  letter-spacing: -.025em; color: var(--text);
}
.metric.success .metric-value { color: var(--success); }
.metric.error .metric-value { color: var(--error); }
.metric.warning .metric-value { color: var(--warning); }
.metric.information .metric-value { color: var(--info); }
@media (max-width: 800px) {
  .metrics { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

/* Two full-width result tables. */
.section-title {
  margin: 0 0 11px; color: var(--secondary);
  font-size: 12px; font-weight: 550; line-height: 1.45;
}
.table-scroll {
  width: 100%; min-width: 0; overflow-x: auto;
  border: 1px solid var(--border); border-radius: 8px;
  background: var(--surface);
}
table { border-collapse: collapse; border-spacing: 0; width: 100%; color: var(--text); }
table.tbl-errors {
  width: 100%; margin: 0; table-layout: fixed;
  font-size: 12px; line-height: 1.45;
}
.tbl-errors th, .tbl-errors td {
  padding: 10px 12px; text-align: left; vertical-align: top;
  border: 0; border-bottom: 1px solid var(--border-soft);
  overflow-wrap: anywhere;
}
.tbl-errors thead th {
  background: var(--surface-raised); color: var(--muted);
  font-size: 10px; font-weight: 650; letter-spacing: .06em;
  line-height: 1.35; text-transform: uppercase;
}
.tbl-errors tbody tr:last-child td { border-bottom: 0; }
.tbl-errors tbody tr:nth-child(even):not(.message-row) td { background-color: rgba(255,255,255,.012); }
.tbl-errors tbody tr:hover td { background-color: rgba(255,255,255,.018); transition: background-color .15s ease; }
.summary-table th:first-child, .summary-table td:first-child { width: 64%; }
.summary-table th:nth-child(n+2), .summary-table td:nth-child(n+2) {
  width: 12%; text-align: center; font-variant-numeric: tabular-nums;
}
.step-name { display: block; margin-bottom: 2px; font-size: 12px; font-weight: 550; color: var(--text); }
.step-id { color: var(--muted); font-size: 11px; }
.details-table .col-pos { width: 12%; }
.details-table .col-code { width: 12%; }
.details-table .col-level { width: 12%; }
.details-table tr.message-row.error td { background: rgba(227,151,147,.060); }
.details-table tr.message-row.warning td { background: rgba(223,188,119,.050); }
.details-table tr.message-row.information td { background: rgba(188,198,214,.025); }
.badge {
  display: inline-flex; max-width: 100%; align-items: center;
  padding: 4px 8px; border: 1px solid var(--border);
  border-radius: 5px; background: var(--info-bg);
  color: var(--info); font-size: 10px; font-weight: 600; line-height: 1.2;
  overflow-wrap: anywhere;
}
.badge.error { color: var(--error); border-color: #634242; background: var(--error-bg); }
.badge.warning { color: var(--warning); border-color: #5d5039; background: var(--warning-bg); }
.badge.information { color: var(--info); border-color: #414949; background: var(--info-bg); }
.message-text { margin-bottom: 8px; color: var(--text); font-size: 12px; line-height: 1.55; }
.message-meta { display: flex; flex-wrap: wrap; gap: 6px; min-width: 0; }
.meta-chip {
  display: inline-flex; align-items: baseline; gap: 8px;
  max-width: 100%; padding: 6px 9px;
  border: 1px solid var(--border-soft); border-radius: 6px;
  background: var(--surface-raised);
}
.meta-chip.path {
  display: flex; width: 100%; align-items: flex-start;
  padding: 8px 10px; background: #202425;
  border-color: var(--border-soft);
}
.meta-label {
  flex: 0 0 auto; color: var(--muted);
  font-size: 10px; font-weight: 600; line-height: 1.5; white-space: nowrap;
}
.meta-value {
  color: var(--secondary); font-size: 11px; font-weight: 550;
  font-variant-numeric: tabular-nums;
}
code.xpath {
  display: block; min-width: 0; background: transparent;
  color: var(--secondary);
  font: 400 10.5px/1.65 "SFMono-Regular", Consolas, "Liberation Mono", monospace;
  overflow-wrap: anywhere; word-break: break-word; white-space: normal;
}

/* Invoice document tree stays generated by upstream KoSIT. */
table.document { width: 100%; table-layout: fixed; font-size: 12px; line-height: 1.45; }
table.document td { padding: 7px 10px; vertical-align: top; border-bottom: 1px solid var(--border-soft); }
table.document tr:last-child td { border-bottom: 0; }
table.document tr:hover td { background: var(--surface-raised); }
table.document td.pos {
  width: 68px; color: var(--muted);
  font: 400 10px/1.5 "SFMono-Regular", Consolas, monospace;
  font-variant-numeric: tabular-nums;
}
table.document td.element { width: auto; overflow-wrap: anywhere; }
table.document td.element::before {
  content: attr(title); margin-right: 8px; color: var(--secondary); font-weight: 600;
}
table.document td.level1 { padding-left: 10px; }
table.document td.level2 { padding-left: 20px; }
table.document td.level3 { padding-left: 30px; }
table.document td.level4 { padding-left: 40px; }
table.document td.level5 { padding-left: 50px; }
table.document td.level6 { padding-left: 60px; }
table.document div.attribute { display: inline; margin-right: 8px; color: var(--muted); font-style: italic; }
table.document div.attribute::before { content: attr(title) '='; margin-right: 2px; font-style: normal; }
table.document div.val { display: inline; color: var(--text); font-weight: 550; }
.report-footer { padding: 0 2px; }
.report-footer p.info { margin: 0; color: var(--muted); font-size: 11px; }

@media (max-width: 800px) {
  .page { width: calc(100% - 24px); margin: 16px auto 24px; }
  .section { padding: 16px; }
  .metadata dl { grid-template-columns: minmax(135px, 38%) minmax(0, 1fr); }
  .summary-table { min-width: 540px; }
  .details-table { min-width: 680px; }
  .summary-table th:first-child, .summary-table td:first-child { width: 58%; }
  .summary-table th:nth-child(n+2), .summary-table td:nth-child(n+2) { width: 14%; }
}
@media (max-width: 520px) {
  .page { width: calc(100% - 16px); }
  .section { padding: 13px; border-radius: 8px; }
  .metadata dl { grid-template-columns: 1fr; gap: 3px; }
  .metadata dd { margin-bottom: 7px; }
  .metrics { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}
@media print {
  :root {
    color-scheme: light;
    --bg: #fff; --surface: #fff; --surface-raised: #f5f6f6;
    --surface-hover: #f5f6f6; --border: #cdd1cf; --border-soft: #e1e4e2;
    --text: #161918; --secondary: #444a48; --muted: #565e5b;
    --error: #9d3b3b; --error-bg: #fff1f1;
    --warning: #765315; --warning-bg: #fff6e9;
    --success: #326748; --success-bg: #eff7f1;
    --info: #444a48; --info-bg: #f1f3f3;
  }
  html, body { background: #fff; color: #161918; }
  .page { width: 100%; max-width: none; margin: 0; }
  .section { break-inside: auto; box-shadow: none; background: #fff; }
  .conformance-section.is-success, .conformance-section.is-issue, .conformance-section.is-caution { background: #fff; }
  .tbl-errors thead th { background: #e9edea; color: #3a443c; }
  .table-scroll { overflow: visible; }
  .metric.success .metric-value { color: #326748; }
  .metric.error .metric-value { color: #9d3b3b; }
  .metric.warning .metric-value { color: #765315; }
  .metric.information .metric-value { color: #444a48; }
  thead { display: table-header-group; }
  tr { break-inside: avoid; }
}
      ]]></style>
    </head>
  </xsl:template>

  <!-- Only adds layout containers; every source text-producing template stays upstream. -->
  <xsl:template name="html:document" xmlns="http://www.w3.org/1999/xhtml">
    <div class="page">
      <header class="page-header">
        <h1>Prüfbericht</h1>
      </header>

      <section class="section metadata-section">
        <xsl:call-template name="html:document-metadata" />
      </section>

      <section class="section conformance-section {
        if (empty(rep:scenarioMatched/s:scenario)
            or rep:scenarioMatched/s:scenario/s:name[contains(normalize-space(lower-case(text())), 'fallback')]
            or exists(//rep:message[rep:custom-level(.) = 'error'])) then 'is-issue'
        else if (exists(//rep:message[@level = ('error', 'warning')])) then 'is-caution'
        else 'is-success'
      }">
        <!-- Original KoSIT text, unchanged. -->
        <xsl:call-template name="html:conformance" />
        <div class="metrics">
          <div class="metric information">
            <span class="metric-label">Prüfschritte</span>
            <span class="metric-value"><xsl:value-of select="count(//rep:validationStepResult)" /></span>
          </div>
          <div class="metric error">
            <span class="metric-label">Fehler</span>
            <span class="metric-value"><xsl:value-of select="count(//rep:message[@level eq 'error'])" /></span>
          </div>
          <div class="metric warning">
            <span class="metric-label">Warnungen</span>
            <span class="metric-value"><xsl:value-of select="count(//rep:message[@level eq 'warning'])" /></span>
          </div>
          <div class="metric information">
            <span class="metric-label">Informationen</span>
            <span class="metric-value"><xsl:value-of select="count(//rep:message[@level eq 'information'])" /></span>
          </div>
        </div>
      </section>

      <div class="assessment-section">
        <xsl:call-template name="html:assessment" />
      </div>

      <xsl:if test="//rep:message">
        <xsl:call-template name="html:validation-overview" />
      </xsl:if>

      <xsl:if test="//rep:message">
        <xsl:call-template name="html:validation-details" />
      </xsl:if>

      <xsl:if test="$input-document instance of document-node(element())">
        <section class="section document-section">
          <xsl:call-template name="html:contentdoc">
            <xsl:with-param name="invoice" select="$input-document" />
          </xsl:call-template>
        </section>
      </xsl:if>

      <footer class="report-footer">
        <xsl:call-template name="html:epilog" />
      </footer>
    </div>
  </xsl:template>

  <!--
    Only changes HTML layout of the original two result tables. All displayed
    labels, rule text, IDs, XPath values, adjusted grades and RAW severity counts
    use exactly the same expressions and labels as KoSIT default-report.xsl.
  -->
  <xsl:template name="html:validation-overview" as="element()*" xmlns="http://www.w3.org/1999/xhtml">
    <section class="section">
      <p class="section-title">Übersicht der Validierungsergebnisse:</p>
      <div class="table-scroll">
        <table class="tbl-errors summary-table">
          <thead>
            <tr>
              <th>Prüfschritt</th>
              <th>Fehler</th>
              <th>Warnungen</th>
              <th>Informationen</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="//rep:validationStepResult">
              <tr>
                <td>
                  <span class="step-name"><xsl:value-of select="s:resource/s:name" /></span>
                  <span class="step-id"><xsl:text> (</xsl:text><xsl:value-of select="@id" /><xsl:text>)</xsl:text></span>
                </td>
                <td><xsl:value-of select="count(rep:message[@level eq 'error'])" /></td>
                <td><xsl:value-of select="count(rep:message[@level eq 'warning'])" /></td>
                <td><xsl:value-of select="count(rep:message[@level eq 'information'])" /></td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </div>
    </section>

  </xsl:template>

  <xsl:template name="html:validation-details" as="element()*" xmlns="http://www.w3.org/1999/xhtml">
    <section class="section">
      <p class="section-title">Validierungsergebnisse im Detail:</p>
      <div class="table-scroll">
        <table class="tbl-errors details-table">
          <colgroup>
            <col class="col-pos" />
            <col class="col-code" />
            <col class="col-level" />
            <col />
          </colgroup>
          <thead>
            <tr>
              <th>Pos</th>
              <th>Code</th>
              <th>Adj. Grad</th>
              <th>Text</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="//rep:message">
              <xsl:variable name="level" select="rep:custom-level(.)" />
              <tr class="message-row {$level}">
                <td><xsl:value-of select="@id" /></td>
                <td><xsl:value-of select="@code" /></td>
                <td><span class="badge {$level}"><xsl:value-of select="$level" /></span></td>
                <td>
                  <div class="message-text"><xsl:value-of select="normalize-space(.)" /></div>
                  <xsl:if test="@xpathLocation or @lineNumber or @columnNumber">
                    <div class="message-meta">
                      <xsl:if test="@xpathLocation">
                        <div class="meta-chip path">
                          <span class="meta-label">Pfad: </span>
                          <code class="xpath"><xsl:value-of select="@xpathLocation" /></code>
                        </div>
                      </xsl:if>
                      <xsl:if test="@lineNumber">
                        <div class="meta-chip">
                          <span class="meta-label">Zeile: </span>
                          <span class="meta-value"><xsl:value-of select="@lineNumber" /></span>
                        </div>
                      </xsl:if>
                      <xsl:if test="@columnNumber">
                        <div class="meta-chip">
                          <span class="meta-label">Spalte: </span>
                          <span class="meta-value"><xsl:value-of select="@columnNumber" /></span>
                        </div>
                      </xsl:if>
                    </div>
                  </xsl:if>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </div>
    </section>
  </xsl:template>
</xsl:stylesheet>
