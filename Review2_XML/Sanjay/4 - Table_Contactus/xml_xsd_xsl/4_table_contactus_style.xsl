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
						<th>Contact ID</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Email</th>
						<th>Message</th>
					</tr>
					<xsl:for-each select="contactus/row">
						<tr>
							<td>
								<xsl:value-of select="contact_id"/>
							</td>
							<td>
								<xsl:value-of select="contact_name"/>
							</td>
							<td>
								<xsl:value-of select="contact_phone"/>
							</td>
							<td>
								<xsl:value-of select="contact_email"/>
							</td>
							<td>
								<xsl:value-of select="contact_message"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>