from datetime import date
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from pathlib import Path
from email import encoders
import smtplib

def sendMail(fromEmail,fromPassword,subject,contentPath,contentFilename,maillistPath,maillistFilename,attachmentPath,attachmentFilename):
    # create message object instance
    msg = MIMEMultipart()
    # setup the parameters of the message
    password = fromPassword
    msg['From'] = fromEmail
    msg['Subject'] = subject
    # add in the message body
    msg.attach(MIMEText("Network Monitoring Alert!\n\n"+getMessage(contentPath,contentFilename), 'plain'))
    dataFolder = Path(attachmentPath)
    filename = dataFolder/attachmentFilename
    attachment = open(filename, "rb")
    # instance of MIMEBase and named as p
    p = MIMEBase('application', 'octet-stream')
    # To change the payload into encoded form
    p.set_payload((attachment).read())
    # encode into base64
    encoders.encode_base64(p)
    p.add_header('Content-Disposition', "attachment; filename= %s" % attachmentFilename)
    # attach the instance 'p' to instance 'msg'
    msg.attach(p)
    #create server
    server = smtplib.SMTP('smtp.gmail.com: 587')
    server.starttls()
    # Login Credentials for sending the mail
    server.login(msg['From'], password)
    for mail in getMailList(maillistPath,maillistFilename):
        # send the message via the server.
        server.sendmail(msg['From'], mail, msg.as_string())
    #print(message)
    server.quit()

def getMessage(path,filename):
    dataFolder = Path(path)
    file = dataFolder/filename
    f = open(file, "r")
    return f.read()

def getMailList(path,filename):
    dataFolder = Path(path)
    file = dataFolder/filename
    f = open(file, "r")
    return f.read().strip().split(',')