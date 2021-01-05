mysqldump -u root -p'admin@dxit123!@#' test > $(date +%Y%m%d).sql
/home/qaserverdb2001/azcopy copy /home/qaserverdb2001/$(date +%Y%m%d).sql "https://qablob2001.blob.core.windows.net/qacontainer2001/?sv=2019-12-12&ss=b&srt=sco&sp=rwdlacx&se=2021-01-15T06:30:00Z&st=2020-10-09T12:14:30Z&spr=https&sig=%2BdLnl%2F9lbASwJI9%2FTfCHwkjd%2FjAKoJ1CI0w9irY7cno%3D" --recursive=true

