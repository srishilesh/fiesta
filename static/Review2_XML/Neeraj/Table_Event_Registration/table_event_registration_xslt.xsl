<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
                <link rel="stylesheet" href="tablecss.css" />
                <link rel="stylesheet" href="style.css" />
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia" />
            </head>
            <body>
                <center>
                    <h2>Table Event Registration</h2>
                </center>
                <table class="table_props" id="table-title">
                    <tr id="table-heading">
                        <th>Event_ID</th>
                        <th>Team_ID</th>
                        <th>Registration_datetime</th>
                    </tr>
                    <xsl:for-each select="root">
                        <tr>
                            <td>
                                <xsl:value-of select="event_id" />
                            </td>
                            <td>
                                <xsl:value-of select="team_id" />
                            </td>
                            <td>
                                <xsl:value-of select="registration_datetime" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

