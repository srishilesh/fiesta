<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
	<style>
		table {
		width: 900px;
		border-collapse: collapse;
		margin:50px auto;
		}
		tr:nth-of-type(odd) {
		background: #eee;
		}
		th {
		background: #3498db;
		color: white;
		font-weight: bold;
		}
		td, th {
		padding: 10px;
		border: 1px solid #ccc;
		text-align: left;
		font-size: 15px;
		font-family: "Verdana";
		}
	</style>
</head>
<body style="text-align:center">
	<table>
		<tr>
			<th>Event ID</th>
			<th>Team ID</th>
			<th>Position</th>
		</tr>
		<xsl:for-each select="event_winners/row">
			<tr>
				<td>
					<xsl:value-of select="event_id"/>
				</td>
				<td>
					<xsl:value-of select="team_id"/>
				</td>
				<td>
					<xsl:value-of select="position"/>
				</td>
			</tr>
		</xsl:for-each>
	</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>