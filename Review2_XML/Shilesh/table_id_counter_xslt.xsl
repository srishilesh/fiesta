<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
                <link rel="stylesheet" href="./css/tablecss.css" />
                <link rel="stylesheet" href="./css/style.css" />
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia" />
            </head>
            <body>
                <center>
                    <h2>Table ID counter</h2>
                </center>
                <table class="table_props" id="table-title">
                    <tr id="table-heading">
                        <th>Student_ID</th>
                        <th>Team_ID</th>
                        <th>Event_ID</th>
                        <th>Announcement_ID</th>
                        <th>Contact_ID</th>
                        <th>News_ID</th>
                    </tr>
                    <xsl:for-each select="root">
                        <tr>
                            <td>
                                <xsl:value-of select="student_id" />
                            </td>
                            <td>
                                <xsl:value-of select="team_id" />
                            </td>
                            <td>
                                <xsl:value-of select="event_id" />
                            </td>
                            <td>
                                <xsl:value-of select="announcement_id" />
                            </td>
                            <td>
                                <xsl:value-of select="contact_id" />
                            </td>
                            <td>
                                <xsl:value-of select="news_id" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>