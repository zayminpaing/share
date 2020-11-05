from datetime import datetime
from pythonping import ping
from mail import sendMail

hosts_filename = "network_monitoring_hosts.txt"
emails_filename = "network_monitoring_emails.txt"
results_filename = "network_monitoring_results.txt"
body_filename = "network_monitoring_content.txt"
hosts_file = open(hosts_filename, "r")

# creates an empty set
host_ip_addresses = []
for hosts in hosts_file:
    host_ip_addresses.append(hosts.strip())
#print(host_ip_addresses)

# Takes host IPs and filename and return true if all hosts are responsive; false otherwise
# Pings the host IPsa and output results filename
def ping_and_save(host_ip_addresses, filename):
    hosts_responsive = True
    email_body_file = open(body_filename, "w")
    with open(filename, "a") as result_file:
        for host_ip in host_ip_addresses:
            ping_response = ping(host_ip)
            response_msg = str(ping_response._responses[0])
            dateTimeObj = datetime.now()
            if response_msg.startswith('Ping request could not find host') or \
    response_msg.startswith('Request timed out') or \
    response_msg.endswith('unreachable'):
                hosts_responsive = False
                result_file.write(str(dateTimeObj) + " : " + host_ip + ", Failure!\n")
                email_body_file.write(str(dateTimeObj) + " : " + host_ip + ", Failure!\n\n")
            else:
                hosts_responsive = True
                result_file.write(str(dateTimeObj) + " : " + host_ip + ", Successful, Avg RTT:" + str(ping_response.rtt_avg_ms) + "\n")
    return hosts_responsive

all_hosts_responsive = ping_and_save(host_ip_addresses, results_filename)

from_email = "dxitbot@gmail.com"
from_password = "admin123!@#"
email_subject = "Network Monitoring Alert"
file_path = "C:/PythonFileCode/NetworkMonitoringEmailing"

if all_hosts_responsive:
    # things are good
    print("All hosts are responsive")
else:
    # send email and attach host IPs ping results file
    print("Not all hosts were responsive. Sending email with results files...")
    fromEmail = from_email
    fromPassword = from_password
    subject = email_subject
    contentPath = file_path
    contentFilename = body_filename
    maillistPath = file_path
    maillistFilename = emails_filename
    attachmentPath = file_path
    attachmentFilename = results_filename
    sendMail(fromEmail,fromPassword,subject,contentPath,contentFilename,maillistPath,maillistFilename,attachmentPath,attachmentFilename)



#########
# steps #
#########
# 1) get host ip addresses from file -->  6:30 to 6:45
# 2) install Python Ping from : pip install pythonping -->  6:45 to 7:00 pm
#    details document at https://pypi.org/project/pythonping/
#       if you don't have pip latest version, do this: python -m pip install --upgrade pip
#       if you still don't see pip, make an entry to you Environment Variable for pip folder
#           e.g. "C:\Users\Joey\AppData\Local\Programs\Python\Python38\Scripts"
# 3) ping ip addresses -->  7:00 to 7:15 pm
# 4) understand return value -->  7:15 to 7:30 pm
#    https://www.ictshore.com/python/python-ping-tutorial/
# 5) output formatting with timestamp --> 7:30 to 8:00 pm
#       e.g. 2020-11-04 19:56:17.002313 : 172.217.194.147, Successful, Avg RTT:67
# 6) incorporate actual prod host IPs --> 8:00 to 8:30 pm